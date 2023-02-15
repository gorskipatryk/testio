import UIKit

public protocol AlertPresenting {
    func present(title: String, subtitle: String?, on viewController: UIViewController?)
}

public final class AlertPresenter: AlertPresenting {
    // MARK: - Initialization

    public init() { }

    // MARK: - AlertPresenting

    public func present(title: String, subtitle: String?, on viewController: UIViewController?) {
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        DispatchQueue.main.async { viewController?.present(alert, animated: true) }
    }
}
