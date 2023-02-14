import testioCommon

protocol LoginPresenting {
    func presentAlert(title: String, subtitle: String?)
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

    // MARK: - Private

    private let router: LoginRouting
    private let alertPresenter: AlertPresenting
}
