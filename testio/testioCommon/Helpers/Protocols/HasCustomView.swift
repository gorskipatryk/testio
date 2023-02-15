import UIKit

public protocol HasCustomView {
    associatedtype MainView: UIView
}

public extension HasCustomView where Self: UIViewController {
    var castView: MainView {
        guard let castView = view as? MainView else {
            fatalError("Expected \(MainView.self), got \(type(of: view.self)) instead")
        }
        return castView
    }
}
