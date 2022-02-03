//
//  SearchClient.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation

class SearchClient: APIClient, SearchClientProtocol {
    
    let session: URLSession

    // MARK: - Initializers

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        self.init(configuration: configuration)
    }
    
    // MARK: - Search Giphy
    
    func searchGiphy(searchText: String,
                     page: Int?,
                     completion: @escaping (Result<DLSearchResult?, APIError>) -> Void) {
        
        let request = SearchProvider.search(searchText: searchText,
                                            page: page ?? 0).request
        
        fetch(with: request,
              decode: { json -> DLSearchResult? in
            
            guard let searchResult = json as? DLSearchResult else { return nil }
            
            return searchResult
            
        }, completion: completion)
        
    }
    
}
