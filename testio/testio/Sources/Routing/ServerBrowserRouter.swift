import testioAuth
import testioServerBrowser
import UIKit

final class ServerBrowserRouter: ServerBrowserRouting {
    // MARK: - Initialization

    init(navigationController: UINavigationController, serverListFactory: ServerBrowserFactoring = ServerBrowserFactory()) {
        self.navigationController = navigationController
        self.serverListFactory = serverListFactory
    }

    // MARK: - ServerBrowserRouting

    let navigationController: UINavigationController

    func initialViewController() -> UIViewController {
        serverListFactory.makeServerBrowserScreen(with: self)
    }

    func presentServerBrowser() {
        navigationController.pushViewController(initialViewController(), animated: true)
    }

    func logout() {
        navigationController.popViewController(animated: true)
    }

    // MARK: - Private

    private let serverListFactory: ServerBrowserFactoring
}
