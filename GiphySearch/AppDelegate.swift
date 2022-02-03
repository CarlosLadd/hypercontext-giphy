//
//  AppDelegate.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // DI
        _ = DIContainer.shared
        
        configureGlobalAppearanceIfNeeded()
        
        // Keep low memory
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 100 * 1024
        KingfisherManager.shared.cache.memoryStorage.config.countLimit = 125
        
        // Getting ApiKey
        let config: BaseConfig = PropertyListHelper.decode()
        
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        remoteDataSource.configure(with: config.keys.apiKey)
        
        window?.rootViewController = MainTabBarBuilder.buildViewController()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Code
    }
    
    // MARK: - Helpers
    
    func configureGlobalAppearanceIfNeeded() {
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance

            let tabBarAppearance = UITabBarAppearance()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }
    }


}

