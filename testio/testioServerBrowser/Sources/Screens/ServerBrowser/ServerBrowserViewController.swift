import testioCommon
import UIKit

protocol ServerBrowserViewControllerProtocol: UIViewController {
    func present(servers: [Server])
    func stopActivityIndicator()
}

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
        interactor.initialize()
        setUpNavigationBar()
        setUpTableView()
    }

    // MARK: - ServerBrowserViewControllerProtocol

    func stopActivityIndicator() {
        castView.activityIndicator.stopAnimating()
    }

    func present(servers: [Server]) {
        self.servers = servers
    }

    // MARK: - Private

    private let interactor: ServerBrowserInteracting
    private var servers: [Server] = [] {
        didSet {
            castView.tableView.reloadData()
        }
    }

    private func setUpNavigationBar() {
        title = "testio"
        let logoutAction = UIAction { [weak self] _ in
            self?.interactor.logoutButtonDidTap()
        }
        let filterAction = UIAction { _ in
            print("Filter")
        }
        let logoutButton = UIBarButtonItem(title: "Logout", primaryAction: logoutAction)
        navigationItem.setRightBarButton(logoutButton, animated: true)
        let filterButton = UIBarButtonItem(title: "Filter", primaryAction: filterAction)
        navigationItem.setLeftBarButton(filterButton, animated: true)
    }

    private func setUpTableView() {
        castView.tableView.dataSource = self
        castView.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension ServerBrowserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        servers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ServerCell.self), for: indexPath) as? ServerCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = servers[indexPath.row].name
        cell.distanceLabel.text = "\(servers[indexPath.row].distance) km"
        return cell
    }
}

extension ServerBrowserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        TableViewHeaderView()
    }
}
