protocol ServerBrowserPresenting { }

final class ServerBrowserPresenter: ServerBrowserPresenting {
    // MARK: - Initialization

    init(router: ServerBrowserRouting) {
        self.router = router
    }

    // MARK: - Public

    weak var viewController: ServerBrowserViewControllerProtocol?

    // MARK: - Private

    private weak var router: ServerBrowserRouting?
}
