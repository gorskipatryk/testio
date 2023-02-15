import testioCommon

protocol LoginInteracting {
    func loginButtonDidTap(username: String?, password: String?)
}

final class LoginInteractor: LoginInteracting {
    // MARK: - Initialization

    init(presenter: LoginPresenting, loginService: LoginServiceProtocol) {
        self.presenter = presenter
        self.loginService = loginService
    }

    // MARK: - LoginInteracting

    func loginButtonDidTap(username: String?, password: String?) {
//        guard let username, let password, !username.isEmpty, !password.isEmpty else {
//            presenter.presentAlert(title: "Wrong credentials", subtitle: "Username or password is empty!")
//            return
//        }
//        performLogin(username: username, password: password)
        presenter.presentServerList()
    }

    // MARK: - Private

    private let presenter: LoginPresenting
    private let loginService: LoginServiceProtocol

    private func performLogin(username: String, password: String) {
        Task {
            do {
                try await loginService.logIn(username: username, password: password)
                presenter.presentServerList()
            } catch let error as NetworkError {
                self.presenter.presentAlert(title: error.errorTitle, subtitle: error.failureReason)
            }
        }
    }
}
