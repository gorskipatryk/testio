protocol LoginInteracting { }

final class LoginInteractor: LoginInteracting {
    // MARK: - Initialization

    init(presenter: LoginPresenting) {
        self.presenter = presenter
    }

    // MARK: - Private

    private let presenter: LoginPresenting
}
