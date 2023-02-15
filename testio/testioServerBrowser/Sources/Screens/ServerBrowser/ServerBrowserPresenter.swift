import testioCommon

protocol ServerBrowserPresenting {
    func present(servers: [Server])
    func presentAlert(title: String, subtitle: String?)
    func logout()
}

final class ServerBrowserPresenter: ServerBrowserPresenting {
    // MARK: - Initialization

    init(router: ServerBrowserRouting, alertPresenter: AlertPresenting = AlertPresenter()) {
        self.router = router
        self.alertPresenter = alertPresenter
    }

    // MARK: - Public

    weak var viewController: ServerBrowserViewControllerProtocol?

    // MARK: - ServerBrowserPresenting

    func present(servers: [Server]) {
        viewController?.present(servers: servers)
    }

    func presentAlert(title: String, subtitle: String?) {
        alertPresenter.present(title: title, subtitle: subtitle, on: viewController)
    }

    func logout() {
        router?.logout()
    }

    // MARK: - Private

    private weak var router: ServerBrowserRouting?
    private let alertPresenter: AlertPresenting
}
