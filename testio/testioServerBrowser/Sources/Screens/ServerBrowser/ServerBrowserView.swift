import UIKit

final class ServerBrowserView: UIView {
    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpLayout()
        setUpConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private func setUpLayout() {
        backgroundColor = .cyan
    }

    private func setUpConstraints() {

    }
}
