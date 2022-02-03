//
//  RemoteDataSource.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

final public class RemoteDataSource: RemoteDataSourceProtocol {
    
    public init() { }
    
    public func configure(with apiKey: String) {
        NetworkConfiguration.shared.configure(with: apiKey)
    }
    
    public func searchDataSource() -> RLSearchRemoteDataSourceProtocol {
        let client = SearchClient()
        return SearchRemoteDataSource(client: client)
    }
    
}
