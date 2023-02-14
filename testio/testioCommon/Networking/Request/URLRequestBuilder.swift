public protocol URLRequestBuilding {
    func build(from apiRequest: any APIRequest) throws -> URLRequest
}

public final class URLRequestBuilder: URLRequestBuilding {
    // MARK: - Initialization

    public init() { }

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

        return request
    }
}
