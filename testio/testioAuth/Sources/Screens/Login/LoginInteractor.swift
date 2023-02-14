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

    func initialize() { }

    // MARK: - Private

    private let presenter: LoginPresenting
    private let loginService: LoginServiceProtocol
}
