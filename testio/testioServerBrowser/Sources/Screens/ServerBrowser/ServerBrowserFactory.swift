import testioCommon
import UIKit

public protocol ServerBrowserFactoring {
    func makeServerBrowserScreen(with router: ServerBrowserRouting) -> UIViewController
}

public final class ServerBrowserFactory: ServerBrowserFactoring {
    // MARK: - Initialization

    public init() { }

    // MARK: - ServerBrowserFactoring

    public func makeServerBrowserScreen(with router: ServerBrowserRouting) -> UIViewController {
        let apiClient = APIClient()
        let serverBrowserService = ServerBrowserService(apiClient: apiClient)
        let presenter = ServerBrowserPresenter(router: router)
        let interactor = ServerBrowserInteractor(presenter: presenter, serverBrowserService: serverBrowserService)
        let viewController = ServerBrowserViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
