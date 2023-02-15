import testioCommon

protocol LoginServiceProtocol {
    func logIn(username: String, password: String) async throws
}

final class LoginService: LoginServiceProtocol {
    // MARK: - Initialization

    init(apiClient: APIClientProtocol, tokenStorage: TokenStoring = TokenStorage()) {
        self.apiClient = apiClient
        self.tokenStorage = tokenStorage
    }

    func logIn(username: String, password: String) async throws {
        let request = LoginRequest(username: username, password: password)
        let responseData: APIToken = try await apiClient.perform(request: request)
        try tokenStorage.save(token: responseData.token)
    }

    // MARK: - Private

    private let apiClient: APIClientProtocol
    private let tokenStorage: TokenStoring
}
