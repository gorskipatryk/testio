import testioCommon

protocol LoginInteracting {
    func initialize()
}

final class LoginInteractor: LoginInteracting {
    // MARK: - Initialization

    init(presenter: LoginPresenting, loginService: LoginServiceProtocol) {
        self.presenter = presenter
        self.loginService = loginService
    }

    // MARK: - LoginInteracting

    func initialize() {
        Task {
            do { try await loginService.logIn(username: "test", password: "test") }
            catch let error as KeychainError {
                DispatchQueue.main.async {
                    self.presenter.presentAlert(title: error.localizedDescription, subtitle: error.failureReason)
                }
            } catch let error as NetworkError {
                DispatchQueue.main.async {
                    self.presenter.presentAlert(title: error.localizedDescription, subtitle: error.failureReason)
                }
            }
        }
    }

    // MARK: - Private

    private let presenter: LoginPresenting
    private let loginService: LoginServiceProtocol
}
