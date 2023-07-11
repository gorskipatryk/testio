public protocol APIClientProtocol {
    func perform<T: APIRequest>(request: T) async throws -> T.Resource where T.Resource: Codable
}

public final class APIClient: APIClientProtocol {

    // MARK: - Initialization

    public init(urlSession: URLSession = URLSession.shared,
                urlRequestBuilder: URLRequestBuilding = URLRequestBuilder(),
                dataParser: DataParserProtocol = DataParser()) {
        self.urlSession = urlSession
        self.urlRequestBuilder = urlRequestBuilder
        self.dataParser = dataParser
    }

    // MARK: - APIClientProtocol

    public func perform<T: APIRequest>(request: T) async throws -> T.Resource where T.Resource: Codable {
        let urlRequest = try urlRequestBuilder.build(from: request)
        let (data, response) = try await urlSession.data(for: urlRequest)
        if let error = NetworkError(from: response) { throw error }
        let decodedResponse: T.Resource = try dataParser.decode(data: data)
        return decodedResponse
    }

    // MARK: - Private

    private let urlSession: URLSession
    private let urlRequestBuilder: URLRequestBuilding
    private let dataParser: DataParserProtocol
}
