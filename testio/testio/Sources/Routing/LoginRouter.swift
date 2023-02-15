import testioAuth
import testioServerBrowser
import UIKit

final class LoginRouter: LoginRouting {
    // MARK: - Initalization
    
    init(navigationController: UINavigationController, loginFactory: LoginFactoring = LoginFactory(), serverBrowserRouter: ServerBrowserRouting) {
        self.navigationController = navigationController
        self.loginFactory = loginFactory
        self.serverBrowserRouter = serverBrowserRouter
    }

    // MARK: - LoginRouting

    let navigationController: UINavigationController

    func initialViewController() -> UIViewController {
        loginFactory.makeLoginScreen(with: self)
    }

    func navigateToServerList() {
        serverBrowserRouter.presentServerBrowser()
    }

    // MARK: - Private

    private let loginFactory: LoginFactoring
    private let serverBrowserRouter: ServerBrowserRouting
}
