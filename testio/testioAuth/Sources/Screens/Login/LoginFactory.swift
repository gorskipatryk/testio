import testioCommon
import UIKit

public protocol LoginFactoring {
    func makeLoginScreen(with router: LoginRouting) -> UIViewController
}

public final class LoginFactory: LoginFactoring {
    // MARK: - Initialization

    public init() { }

    // MARK: - LoginFactoring

    public func makeLoginScreen(with router: LoginRouting) -> UIViewController {
        let apiClient = APIClient()
        let loginService = LoginService(apiClient: apiClient)
        let presenter = LoginPresenter(router: router)
        let interactor = LoginInteractor(presenter: presenter, loginService: loginService)
        let viewController = LoginViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
