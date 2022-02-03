//
//  SearchViewController.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import UIKit

class SearchViewController: UIViewController, Storyboarded {
    
    static var storyboardName: String = "Search"
    
    private var searchController: CustomSearchController!
    
    var coordinator: SearchCoordinatorProtocol?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        title = "Search on GIPHY"
        view.backgroundColor = .white
        
        setupCustomSearchController()
    }
    
    private func setupCustomSearchController() {
        guard let coordinator = coordinator else { return }
        
        searchController = coordinator.embedSearchController(on: self)
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func startSearch(_ resultController: SearchResultsViewController, withSearchText searchText: String) {
        resultController.startSearch(withSearchText: searchText)
    }
    
}

// MARK: - SearchResultControllerDelegate

extension SearchViewController: SearchResultControllerDelegate {
    
    func searchResultController(_ searchResultController: SearchResultsViewController, didSelectRecentSearch searchText: String) {
        searchController.searchBar.text = searchText
        guard let searchText = searchController.searchBar.text,
            !searchText.isEmpty,
            let searchResultsController = searchController.searchResultsController as? SearchResultsViewController else {
                return
        }
        searchController.searchBar.endEditing(true)
        startSearch(searchResultsController, withSearchText: searchText)
    }
    
}

// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchResultsController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        searchController.searchResultsController?.view.isHidden = false
        
        if let isEmpty = searchController.searchBar.text?.isEmpty, isEmpty {
            searchResultsController.resetSearch()
        }
    }

}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text,
            !searchText.isEmpty,
            let searchResultsController = searchController.searchResultsController as? SearchResultsViewController else {
                return
        }
         
        startSearch(searchResultsController, withSearchText: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        guard let searchResultsController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        searchResultsController.resetSearch()
    }

}
