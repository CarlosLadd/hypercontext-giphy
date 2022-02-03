//
//  MainTabBarBuilder.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

final class MainTabBarBuilder {
    
    class func buildViewController() -> UIViewController {
        
        // Search
        let searchNavigationController = createNavigationController(title: "Search", image: UIImage(systemName: "magnifyingglass")!)
        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        searchCoordinator.start()
        
        // Favorites
        let favoritesNavigationController = createNavigationController(title: "Favorites", image: UIImage(systemName: "star.fill")!)
        let favoritesCoordinator = FavoritesCoordinator(navigationController: favoritesNavigationController)
        favoritesCoordinator.start()
        
        // Main TabBarController
        let tabBarController = MainTabBarController()
        
        tabBarController.viewControllers = [
            searchNavigationController,
            favoritesNavigationController
        ]
        
        return tabBarController
    }
    
    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }
    
}
