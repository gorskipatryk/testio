import UIKit

final class ServerBrowserView: UIView {
    private struct Constants {
        static let rowHeight: CGFloat = 44
    }
    // MARK: - Subviews

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = Constants.rowHeight
        tableView.register(ServerCell.self, forCellReuseIdentifier: String(describing: ServerCell.self))
        return tableView
    }()

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setUpLayout()
        setUpConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private func setUpLayout() {
        addSubview(tableView)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
