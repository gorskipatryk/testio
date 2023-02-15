import testioCommon

protocol LoginPresenting {
    func presentAlert(title: String, subtitle: String?)
    func presentServerList()
}

final class LoginPresenter: LoginPresenting {
    // MARK: - Initialization

    init(router: LoginRouting, alertPresenter: AlertPresenting = AlertPresenter()) {
        self.router = router
        self.alertPresenter = alertPresenter
    }

    // MARK: - Public

    weak var viewController: LoginViewControllerProtocol?

    // MARK: - LoginPresenting

    func presentAlert(title: String, subtitle: String?) {
        alertPresenter.present(title: title, subtitle: subtitle, on: viewController)
    }

    func presentServerList() {
        router?.navigateToServerList()
    }

    // MARK: - Private

    private weak var router: LoginRouting?
    private let alertPresenter: AlertPresenting
}
