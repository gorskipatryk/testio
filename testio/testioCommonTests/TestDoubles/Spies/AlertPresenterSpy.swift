import testioCommon
import UIKit

final class AlertPresenterSpy: AlertPresenting {
    private(set) var caughTitle: String = ""
    private(set) var caughtSubtitle: String? = ""
    private(set) var caughtViewController: UIViewController? = nil

    // MARK: - AlertPresenting

    func present(title: String, subtitle: String?, on viewController: UIViewController?) {
        caughTitle = title
        caughtSubtitle = subtitle
        caughtViewController = viewController
    }
}
