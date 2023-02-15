public struct ServerListRequest: APIRequest {
    public var requestMethod: APIRequestMethod = .GET
    public var urlPath: String = "/v1/servers"
    public var urlParameters: [String : String]? = nil
    public var requiresAuthorization: Bool = true

    public init() { }
}
