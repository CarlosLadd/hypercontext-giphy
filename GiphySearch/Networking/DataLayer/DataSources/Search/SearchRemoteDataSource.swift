//
//  SearchRemoteDataSource.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

final class SearchRemoteDataSource: RLSearchRemoteDataSourceProtocol {
    
    private let client: SearchClientProtocol
    
    init(client: SearchClientProtocol) {
        self.client = client
    }
    
    func searchGiphy(searchText: String,
                     page: Int?,
                     completion: @escaping (Result<[MLGiphy], Error>) -> Void) {
        
        client.searchGiphy(searchText: searchText,
                           page: page,
                           completion: { result in
            switch result {
            case .success(let searchResult):
                guard let search_result = searchResult else { return }
                
                let search = search_result.data.map { $0.asModel() }
                completion(.success(search))
                
            case .failure(let error):
                completion(.failure(error))
            }
        })
        
    }
    
}
