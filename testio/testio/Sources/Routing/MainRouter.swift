import testioAuth
import testioCommon
import testioServerBrowser
import UIKit

protocol MainRouterProtocol {
    func presentInitialViewController(in window: UIWindow)
}

final class MainRouter: MainRouterProtocol {
    // MARK: - Initialization

    init(tokenStorage: TokenStoring = TokenStorage()) {
        self.tokenStorage = tokenStorage
        self.navigationController = UINavigationController()
        self.serverBrowserRouter = ServerBrowserRouter(navigationController: navigationController)
        self.loginRouter = LoginRouter(navigationController: navigationController, serverBrowserRouter: serverBrowserRouter)
    }

    // MARK: - MainRouterProtocol

    func presentInitialViewController(in window: UIWindow) {
        if let token = tokenStorage.read(), !token.isEmpty {
            let loginViewController = loginRouter.initialViewController()
            let serverBrowserViewController = serverBrowserRouter.initialViewController()
            navigationController.setViewControllers([loginViewController, serverBrowserViewController], animated: true)
        } else {
            let loginViewController = loginRouter.initialViewController()
            navigationController.setViewControllers([loginViewController], animated: true)
        }
        window.rootViewController = navigationController
    }

    // MARK: - Private

    private let tokenStorage: TokenStoring
    private let loginRouter: LoginRouting
    private let serverBrowserRouter: ServerBrowserRouting
    private let navigationController: UINavigationController
}
