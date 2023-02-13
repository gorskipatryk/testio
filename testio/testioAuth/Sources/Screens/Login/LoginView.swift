import UIKit

final class LoginView: UIView {
    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private

    private func setUpView() {
        backgroundColor = .yellow
    }

    private func setUpConstraints() {

    }
}
