//
//  SearchResultsInteractor.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation

class SearchResultsInteractor: SearchResultsInteractorProtocol {
    
    private let searchUseCase: MLSearchUseCaseProtocol
    
    // MARK: - Initializer
    
    init(useCaseProvider: UseCaseProviderProtocol) {
        self.searchUseCase = useCaseProvider.searchUseCase()
    }
    
    func searchGiphy(searchText: String,
                     page: Int,
                     completion: @escaping (Result<[MLGiphy], Error>) -> Void) {
        
        // TODO: currentPage * 20 the offset value per page
        searchUseCase.searchGiphy(searchText: searchText,
                                  page: page * 20,
                                  completion: completion)
        
    }
    
}
