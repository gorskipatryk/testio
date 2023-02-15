import testioCommon
import UIKit

protocol LoginViewControllerProtocol: UIViewController { }

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
        setUpLoginButtonAction()
    }

    // MARK: - Private

    private let interactor: LoginInteracting

    private func setUpLoginButtonAction() {
        let buttonAction = UIAction { [weak self] _ in
            self?.castView.endEditing(true)
            self?.interactor.loginButtonDidTap(username: self?.castView.usernameTextField.text,
                                               password: self?.castView.passwordTextField.text)
        }
        castView.loginButton.addAction(buttonAction, for: .touchUpInside)
    }
}
