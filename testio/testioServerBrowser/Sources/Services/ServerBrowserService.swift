import testioCommon

protocol ServerBrowserServiceProtocol {
    func fetchServers() async throws -> [Server]
}

final class ServerBrowserService: ServerBrowserServiceProtocol {
    // MARK: - Initialization

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    // MARK: - LoginServiceProtocol

    func fetchServers() async throws -> [Server] {
        let request = ServerListRequest()
        let responseData = try await apiClient.perform(request: request)
        return responseData
    }

    // MARK: - Private

    private let apiClient: APIClientProtocol
}
