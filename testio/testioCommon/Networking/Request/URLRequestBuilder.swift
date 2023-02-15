public protocol URLRequestBuilding {
    func build(from apiRequest: any APIRequest) throws -> URLRequest
}

public final class URLRequestBuilder: URLRequestBuilding {
    // MARK: - Initialization

    public init(tokenStorage: TokenStoring = TokenStorage()) {
        self.tokenStorage = tokenStorage
    }

    // MARK: - URLRequestBuilding

    public func build(from apiRequest: any APIRequest) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = APIConstants.baseURL
        urlComponents.path = apiRequest.urlPath

        urlComponents.queryItems = apiRequest.urlParameters?
            .compactMap { URLQueryItem(name: $0, value: $1) }

        guard let url = urlComponents.url else { throw NetworkError.invalidUrl }

        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.requestMethod.rawValue

        if apiRequest.requiresAuthorization, let token = tokenStorage.read() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        return request
    }

    // MARK: - Private

    private let tokenStorage: TokenStoring
}
