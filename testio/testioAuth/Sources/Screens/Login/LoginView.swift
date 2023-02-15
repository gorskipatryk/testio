import testioCommon
import UIKit

final class LoginView: UIView {
    private struct Constants {
        static let backgroundImageName = "background"
        static let logoViewTopPadding: CGFloat = 133
        static let textFieldsStackViewSpacing: CGFloat = 16
        static let textFieldStackViewTopPadding: CGFloat = 40
        static let textFieldsStackViewHorizontalPadding: CGFloat = 32
        static let textFieldHeight: CGFloat = 40
        static let loginButtonTopPadding: CGFloat = 24
        static let loginButtonHeight: CGFloat = 40
        static let cornerRadius: CGFloat = 10
    }

    // MARK: - Subviews

    let backgroundImageView: UIImageView = {
        let image = UIImage(named: Constants.backgroundImageName)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let logoView: LogoView = {
        let logoView = LogoView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()

    let usernameTextField: IconTextField = {
        let textField = IconTextField(imageName: "username")
        textField.backgroundColor = .Testio.textFieldBackgroundColor
        textField.cornerRadius(Constants.cornerRadius)
        textField.placeholder = "Username"
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: IconTextField = {
        let textField = IconTextField(imageName: "password")
        textField.backgroundColor = .Testio.textFieldBackgroundColor
        textField.isSecureTextEntry = true
        textField.cornerRadius(Constants.cornerRadius)
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.textFieldsStackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .Testio.buttonBackgroundColor
        button.setTitleColor(.Testio.white, for: .normal)
        button.setTitle("Log in", for: .normal)
        button.cornerRadius(Constants.cornerRadius)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private

    private func setUpView() {
        backgroundColor = .white
        addSubview(backgroundImageView)
        addSubview(logoView)
        textFieldsStackView.addArrangedSubview(usernameTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        addSubview(textFieldsStackView)
        addSubview(loginButton)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.logoViewTopPadding),
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            usernameTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight)
        ])

        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight)
        ])

        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: Constants.textFieldStackViewTopPadding),
            textFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.textFieldsStackViewHorizontalPadding),
            textFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.textFieldsStackViewHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: Constants.loginButtonTopPadding),
            loginButton.leadingAnchor.constraint(equalTo: textFieldsStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: textFieldsStackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.loginButtonHeight)
        ])
    }
}
