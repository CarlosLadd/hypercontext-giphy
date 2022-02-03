//
//  RemoteDataSourceProtocol.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

public protocol RemoteDataSourceProtocol {
    
    func configure(with apiKey: String)
    
    func searchDataSource() -> RLSearchRemoteDataSourceProtocol
    
}
