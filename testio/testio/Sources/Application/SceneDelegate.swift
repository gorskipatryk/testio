import testioAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let entryPointDecider: EntryPointDeciding

    override init() {
        self.entryPointDecider = EntryPointDecider(loginFactory: LoginFactory())
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = entryPointDecider.entryPoint()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

