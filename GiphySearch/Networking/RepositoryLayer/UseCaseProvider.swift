//
//  UseCaseProvider.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

public class UseCaseProvider: UseCaseProviderProtocol {
    
    // MARK: - Properties
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    // MARK: - Initializers
    
    public init(remoteDataSource: RemoteDataSourceProtocol) {
        
        self.remoteDataSource = remoteDataSource
        
    }
    
    public func searchUseCase() -> MLSearchUseCaseProtocol {
        
        let remoteDataSource = self.remoteDataSource.searchDataSource()
        
        return RLSearchRepository(remoteDataSource: remoteDataSource)
        
    }
    
}
