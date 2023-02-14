import testioCommon

protocol LoginServiceProtocol {
    func logIn(username: String, password: String) async throws
}

final class LoginService: LoginServiceProtocol {
    // MARK: - Initialization

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func logIn(username: String, password: String) async throws {
        let request = LoginRequest(username: username, password: password)
        let responseData: APIToken = try await apiClient.perform(request: request)
        print(responseData.token)
    }

    // MARK: - Private

    private let apiClient: APIClientProtocol
    
}
