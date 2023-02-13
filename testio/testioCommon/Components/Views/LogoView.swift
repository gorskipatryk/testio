import UIKit

public final class LogoView: UIView {
    private struct Constants {
        static let logoImageName = "logo"
        static let dotImageName = "dot"
        static let dotImageLeadingPadding: CGFloat = 4
    }

    // MARK: - Subviews

    let logoImageView: UIImageView = {
        let image = UIImage(named: Constants.logoImageName)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let dotImageView: UIImageView = {
        let image = UIImage(named: Constants.dotImageName)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initialization

    public init() {
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }

    required public init?(coder: NSCoder) { nil }

    // MARK: - Private

    private func setUpView() {
        addSubview(logoImageView)
        addSubview(dotImageView)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            dotImageView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: Constants.dotImageLeadingPadding),
            dotImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dotImageView.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor)
        ])
    }
}
