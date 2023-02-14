import testioCommon

protocol LoginServiceProtocol {
    func logIn(username: String, password: String) async throws
}

final class LoginService: LoginServiceProtocol {
    // MARK: - Initialization

    init(apiClient: APIClientProtocol, dataParser: DataParserProtocol = DataParser()) {
        self.apiClient = apiClient
        self.dataParser = dataParser
    }

    func logIn(username: String, password: String) async throws {
        let request = LoginRequest(username: username, password: password)
        let responseData = try await apiClient.perform(request: request)
        let response: APIToken = try dataParser.decode(data: responseData)
    }

    // MARK: - Private

    private let apiClient: APIClientProtocol
    private let dataParser: DataParserProtocol
}
