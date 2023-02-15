import testioAuth
import UIKit

final class LoginRouter: LoginRouting {
    // MARK: - Initalization
    
    init(loginFactory: LoginFactoring = LoginFactory()) {
        self.loginFactory = loginFactory
    }

    // MARK: - LoginRouting

    func presentInitialViewController(in window: UIWindow) {
        let loginViewController = loginFactory.makeLoginScreen(with: self)
        window.rootViewController = loginViewController
        currentViewController = loginViewController
    }

    func navigateToServerList() { }

    // MARK: - Private

    private let loginFactory: LoginFactoring
    private weak var currentViewController: UIViewController?
}
