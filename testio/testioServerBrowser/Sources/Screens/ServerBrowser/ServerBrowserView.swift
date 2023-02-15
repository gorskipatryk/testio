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

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
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
        addSubview(activityIndicator)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
