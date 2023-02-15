import testioAuth
import testioCommon
import UIKit

protocol MainRouterProtocol {
    func presentInitialViewController(in window: UIWindow)
}

final class MainRouter: MainRouterProtocol {
    // MARK: - Initialization

    init(tokenStorage: TokenStoring = TokenStorage()) {
        self.tokenStorage = tokenStorage
        self.loginRouter = LoginRouter()
    }

    // MARK: - MainRouterProtocol

    func presentInitialViewController(in window: UIWindow) {
        removeApiToken()
        if let token = tokenStorage.read(), !token.isEmpty {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .yellow
            window.rootViewController = viewController
        } else {
            loginRouter.presentInitialViewController(in: window)
        }
    }

    // MARK: - Private

    private let tokenStorage: TokenStoring
    private let loginRouter: LoginRouting

    // TODO: - Remove
    func removeApiToken() {
        do {
            try tokenStorage.delete()
        } catch { }
    }
}
