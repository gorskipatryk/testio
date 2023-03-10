import UIKit

public protocol LoginRouting: AnyObject {
    var navigationController: UINavigationController { get }

    func initialViewController() -> UIViewController
    func navigateToServerList()
}
