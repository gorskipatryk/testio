public struct LoginRequest: APIRequest {
    public var requestMethod: APIRequestMethod = .POST
    public var urlPath: String = "/v1/tokens"
    public var urlParameters: [String: String]? = nil
    public var requiresAuthorization: Bool = false

    private struct Key {
        static let username = "username"
        static let password = "password"
    }

    public init(username: String, password: String) {
        urlParameters = [
            Key.username: username,
            Key.password: password
        ]
    }
}
