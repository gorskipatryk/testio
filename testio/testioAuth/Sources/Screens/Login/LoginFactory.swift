import testioCommon
import UIKit

public protocol LoginFactoring {
    func makeLoginScreen() -> UIViewController
}

public final class LoginFactory: LoginFactoring {
    // MARK: - Initialization

    public init() { }

    // MARK: - LoginFactoring

    public func makeLoginScreen() -> UIViewController {
        let apiClient = APIClient()
        let loginService = LoginService(apiClient: apiClient)
        let router = LoginRouter()
        let presenter = LoginPresenter(router: router)
        let interactor = LoginInteractor(presenter: presenter, loginService: loginService)
        let viewController = LoginViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
