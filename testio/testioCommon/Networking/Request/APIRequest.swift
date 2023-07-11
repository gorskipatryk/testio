public protocol APIRequest {
    associatedtype Resource

    var requestMethod: APIRequestMethod { get }
    var urlPath: String { get }
    var urlParameters: [String: String]? { get }
    var requiresAuthorization: Bool { get }
}

public enum APIRequestMethod: String {
    case GET, POST
}
