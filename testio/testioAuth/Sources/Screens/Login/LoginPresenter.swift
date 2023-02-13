protocol LoginPresenting { }

final class LoginPresenter: LoginPresenting {
    // MARK: - Initialization

    init(router: LoginRouting) {
        self.router = router
    }

    // MARK: - Public

    weak var viewController: LoginViewControllerProtocol?

    // MARK: - Private

    private let router: LoginRouting
}
