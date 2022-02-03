//
//  SearchProtocols.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import UIKit

protocol SearchCoordinatorProtocol: AnyObject {
    
    func embedSearchController(on parentViewController: SearchResultControllerDelegate) -> CustomSearchController
    
}
