//
//  RLSearchRemoteDataSourceProtocol.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

public protocol RLSearchRemoteDataSourceProtocol {
    
    func searchGiphy(searchText: String,
                     page: Int?,
                     completion: @escaping (Result<[MLGiphy], Error>) -> Void)
    
}
