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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
