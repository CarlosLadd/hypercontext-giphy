//
//  SearchResultsProtocols.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import UIKit

protocol SearchResultsViewModelProtocol {
    
    var searchCells: [SearchResultCellViewModelProtocol] { get }
    
    var searchListViewState: Bindable<PagingViewState<MLGiphy>> { get }
    
    var needsPrefetch: Bool { get }
    
    func searchGiphy(with searchText: String)
    
    func clearSearch()
    
}

protocol SearchResultsInteractorProtocol {
    
    func searchGiphy(searchText: String, page: Int, completion: @escaping (Result<[MLGiphy], Error>) -> Void)
    
}

protocol SearchResultControllerDelegate: UIViewController {

    func searchResultController(_ searchResultController: SearchResultsViewController,
                                didSelectRecentSearch searchText: String)

}

protocol SearchResultCellViewModelProtocol {
    
    var imageURL: URL? { get }
    
}

protocol SearchResultCollectionViewCellProtocol {
    
    var viewModel: SearchResultCellViewModelProtocol? { get set }
    
}

final class SearchResultCellViewModel: SearchResultCellViewModelProtocol {
    
    let imageURL: URL?
    
    init(_ search: MLGiphy) {
        imageURL = URL(string: search.images.fixed_height_small.url)
    }
    
}
