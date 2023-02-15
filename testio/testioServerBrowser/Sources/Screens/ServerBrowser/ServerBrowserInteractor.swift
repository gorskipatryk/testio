import testioCommon

protocol ServerBrowserInteracting {
    func logoutButtonDidTap()
}

final class ServerBrowserInteractor: ServerBrowserInteracting {
    // MARK: - Initialization

    init(presenter: ServerBrowserPresenting, tokenStorage: TokenStoring = TokenStorage()) {
        self.presenter = presenter
        self.tokenStorage = tokenStorage
    }

    // MARK: - ServerBrowserInteracting

    func logoutButtonDidTap() {
        do {
            try tokenStorage.delete()
            presenter.logout()
        } catch { return }
    }

    // MARK: - Private

    private let presenter: ServerBrowserPresenting
    private let tokenStorage: TokenStoring
}
