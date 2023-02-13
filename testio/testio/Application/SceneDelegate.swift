//
//  SceneDelegate.swift
//  testio
//
//  Created by Patryk Górski on 13/02/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

