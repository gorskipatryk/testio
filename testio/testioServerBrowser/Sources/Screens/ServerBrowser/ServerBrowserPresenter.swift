protocol ServerBrowserPresenting {
    func logout()
}

final class ServerBrowserPresenter: ServerBrowserPresenting {
    // MARK: - Initialization

    init(router: ServerBrowserRouting) {
        self.router = router
    }

    // MARK: - Public

    weak var viewController: ServerBrowserViewControllerProtocol?

    // MARK: - ServerBrowserPresenting

    func logout() {
        router?.logout()
    }

    // MARK: - Private

    private weak var router: ServerBrowserRouting?
}
