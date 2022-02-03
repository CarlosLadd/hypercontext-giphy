//
//  CustomSearchController.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import UIKit

class CustomSearchController: UISearchController {

    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        hidesNavigationBarDuringPresentation = false
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "Search all the GIFs"
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
