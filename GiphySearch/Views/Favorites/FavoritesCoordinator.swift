//
//  FavoritesCoordinator.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

final class FavoritesCoordinator: NSObject {
    
    var navigationController: UINavigationController
    
    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .lightGray

        //viewController.viewModel = DIContainer.shared.resolve()
        //viewController.coordinator = self

        //setupNavigationDelegate()

        navigationController.pushViewController(viewController, animated: true)
    }
    
}
