import testioAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let mainRouter: MainRouterProtocol

    override init() {
        self.mainRouter = MainRouter()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        mainRouter.presentInitialViewController(in: window)
        window.makeKeyAndVisible()
        self.window = window
    }
}

