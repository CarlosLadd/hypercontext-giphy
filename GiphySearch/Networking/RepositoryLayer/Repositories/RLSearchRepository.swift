//
//  RLSearchRepository.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

public class RLSearchRepository: MLSearchUseCaseProtocol {
    
    private var remoteDataSource: RLSearchRemoteDataSourceProtocol
    
    init(remoteDataSource: RLSearchRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func searchGiphy(searchText: String,
                            page: Int?,
                            completion: @escaping (Result<[MLGiphy], Error>) -> Void) {
        
        remoteDataSource.searchGiphy(searchText: searchText,
                                     page: page,
                                     completion: completion)
    }
    
}
