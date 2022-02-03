//
//  SceneDelegate.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)

        window?.rootViewController = MainTabBarBuilder.buildViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Code
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Code
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Code
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Code
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Code
    }

}

