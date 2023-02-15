import testioCommon

protocol ServerBrowserInteracting {
    func initialize()
    func logoutButtonDidTap()
}

final class ServerBrowserInteractor: ServerBrowserInteracting {
    // MARK: - Initialization

    init(presenter: ServerBrowserPresenting, tokenStorage: TokenStoring = TokenStorage(), serverBrowserService: ServerBrowserServiceProtocol) {
        self.presenter = presenter
        self.tokenStorage = tokenStorage
        self.serverBrowserService = serverBrowserService
    }

    // MARK: - ServerBrowserInteracting

    func initialize() {
        fetchServers()
    }

    func logoutButtonDidTap() {
        do {
            try tokenStorage.delete()
            presenter.logout()
        } catch { return }
    }

    // MARK: - Private

    private let presenter: ServerBrowserPresenting
    private let tokenStorage: TokenStoring
    private let serverBrowserService: ServerBrowserServiceProtocol

    private func fetchServers() {
        Task {
            do {
                let servers = try await serverBrowserService.fetchServers()
                await MainActor.run { presenter.present(servers: servers) }
            } catch let error as NetworkError {
                await MainActor.run { presenter.presentAlert(title: error.errorTitle, subtitle: error.failureReason) }
            }
        }
    }
}
