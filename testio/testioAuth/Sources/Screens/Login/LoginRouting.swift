import UIKit

public protocol LoginRouting: AnyObject {
    func presentInitialViewController(in window: UIWindow)
    func navigateToServerList()
}
