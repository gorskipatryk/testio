import UIKit

public protocol ServerBrowserRouting: AnyObject {
    var navigationController: UINavigationController { get }

    func initialViewController() -> UIViewController
    func presentServerBrowser()
    func logout()
}
