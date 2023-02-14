import testioCommon
import UIKit

protocol LoginViewControllerProtocol: AnyObject { }

final class LoginViewController: UIViewController, HasCustomView, LoginViewControllerProtocol {
    typealias MainView = LoginView
    // MARK: - Initialization

    init(interactor: LoginInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - View lifecycle

    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.initialize()
    }

    // MARK: - Private

    private let interactor: LoginInteracting
}
