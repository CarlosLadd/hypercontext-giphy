//
//  SearchAssembly.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation
import Swinject

final class SearchAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SearchResultsInteractorProtocol.self) { resolver in
            let useCaseProvider = container.resolve(UseCaseProviderProtocol.self)
            return SearchResultsInteractor(useCaseProvider: useCaseProvider!)
        }
        
        container.register(SearchResultsViewModelProtocol.self) { resolver in
            let interactor = resolver.resolve(SearchResultsInteractorProtocol.self)
            return SearchResultsViewModel(interactor: interactor!)
        }
        
    }
    
}
