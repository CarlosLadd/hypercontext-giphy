//
//  SearchResultsViewModel.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import UIKit

final class SearchResultsViewModel: SearchResultsViewModelProtocol {
    
    // MARK: - Properties
    
    private let interactor: SearchResultsInteractorProtocol
    
    // MARK: - Reactive Properties
    
    private (set) var searchListViewState: Bindable<PagingViewState<MLGiphy>> = Bindable(.initial)
    
    // MARK: - Computed Properties
    
    private var searchResult: [MLGiphy] {
        return searchListViewState.value.currentEntities
    }
    
    var needsPrefetch: Bool {
        return true
    }
    
    var searchCells: [SearchResultCellViewModelProtocol] {
        return searchResult.compactMap { SearchResultCellViewModel($0) }
    }
    
    // MARK: - Initializer
    
    init(interactor: SearchResultsInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - SearchViewModelProtocol
    
    func searchGiphy(with searchText: String) {
        fetchSearchResult(with: searchText,
                          currentPage: searchListViewState.value.currentPage)
    }
    
    func clearSearch() {
        self.searchListViewState.value = .empty
    }
    
    // MARK: - Private
    
    private func fetchSearchResult(with searchText: String, currentPage: Int) {
        print("CURRENT PAGE: \(currentPage)")
        
        interactor.searchGiphy(searchText: searchText,
                               page: currentPage,
                               completion: { result in
            switch result {
            case .success(let giphy):
                self.searchListViewState.value = self.parseSearchResult(search: giphy,
                                                                        currentPage: currentPage,
                                                                        currentSearch: self.searchResult)
            case .failure(let error):
                self.searchListViewState.value = .error(error)
            }
        })
        
    }
    
    private func parseSearchResult(search: [MLGiphy],
                                   currentPage: Int,
                                   currentSearch: [MLGiphy]) -> PagingViewState<MLGiphy> {
        
        var allSearch = (currentPage == 0 ? [] : currentSearch)
        allSearch.append(contentsOf: search)
        
        guard !allSearch.isEmpty else { return .empty }
        
        return search.isEmpty ? .populated(allSearch) : .paging(allSearch, next: currentPage + 1)
    }
    
}
