public protocol APIClientProtocol {
    func perform(request: any APIRequest) async throws -> Data
}

public final class APIClient: APIClientProtocol {
    // MARK: - Initialization

    public init(urlSession: URLSession = URLSession.shared, urlRequestBuilder: URLRequestBuilding = URLRequestBuilder()) {
        self.urlSession = urlSession
        self.urlRequestBuilder = urlRequestBuilder
    }

    // MARK: - APIClientProtocol

    public func perform(request: any APIRequest) async throws -> Data {
        let urlRequest = try urlRequestBuilder.build(from: request)
        let (data, response) = try await urlSession.data(for: urlRequest)
        if let error = NetworkError(from: response) { throw error }
        return data
    }

    // MARK: - Private

    private let urlSession: URLSession
    private let urlRequestBuilder: URLRequestBuilding
}
