import testioAuth
import UIKit

final class LoginRouterSpy: LoginRouting {

    private(set) var navigateToServerListInvokedCount: Int = 0

    // MARK: - LoginRouting

    var navigationController: UINavigationController = UINavigationController()

    func initialViewController() -> UIViewController {
        UIViewController()
    }

    func navigateToServerList() {
        navigateToServerListInvokedCount += 1
    }
}
