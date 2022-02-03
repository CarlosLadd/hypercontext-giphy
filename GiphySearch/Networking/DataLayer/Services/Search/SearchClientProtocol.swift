//
//  SearchClientProtocol.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

protocol SearchClientProtocol {
    
    func searchGiphy(searchText: String,
                     page: Int?,
                     completion: @escaping (Result<DLSearchResult?, APIError>) -> Void)
    
}
