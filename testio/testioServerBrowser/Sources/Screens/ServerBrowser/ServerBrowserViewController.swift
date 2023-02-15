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
        let action = UIAction { _ in
            print("button")
        }
        let button = UIBarButtonItem(systemItem: .camera, primaryAction: action)
        navigationItem.setRightBarButton(button, animated: true)
    }

    // MARK: - Private

    private let interactor: ServerBrowserInteracting
}
