import testioCommon
import UIKit

protocol ServerBrowserViewControllerProtocol: UIViewController { }

final class ServerBrowserViewController: UIViewController, HasCustomView, ServerBrowserViewControllerProtocol {
    typealias MainView = ServerBrowserView

    init(interactor: ServerBrowserInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - View lifecycle

    override func loadView() {
        view = ServerBrowserView()
    }

    override func viewDidLoad() {
        title = "testio"
        let logoutAction = UIAction { [weak self] _ in
            self?.interactor.logoutButtonDidTap()
        }
        let filterAction = UIAction { _ in
            print("Filter")
        }
        let logoutButton = UIBarButtonItem(title: "Logout", primaryAction: logoutAction)
        navigationItem.setRightBarButton(logoutButton, animated: true)
        let filterButton = UIBarButtonItem(title: "Filter", primaryAction: filterAction)
        navigationItem.setLeftBarButton(filterButton, animated: true)
    }

    // MARK: - Private

    private let interactor: ServerBrowserInteracting
}
