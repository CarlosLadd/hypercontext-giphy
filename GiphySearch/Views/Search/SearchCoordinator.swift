//
//  SearchCoordinator.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

final class SearchCoordinator: NSObject {
    
    var navigationController: UINavigationController
    
    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SearchViewController.instantiate()
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - SearchCoordinatorProtocol

extension SearchCoordinator: SearchCoordinatorProtocol {
    
    func embedSearchController(on parentViewController: SearchResultControllerDelegate) -> CustomSearchController {
        
        let searchResultsViewController = SearchResultsViewController(viewModel: DIContainer.shared.resolve())
        let customSearchController = CustomSearchController(searchResultsController: searchResultsViewController)
        
        searchResultsViewController.delegate = parentViewController
        searchResultsViewController.coordinator = self
        
        parentViewController.navigationItem.searchController = customSearchController
        parentViewController.definesPresentationContext = true
        
        return customSearchController
    }
    
}
