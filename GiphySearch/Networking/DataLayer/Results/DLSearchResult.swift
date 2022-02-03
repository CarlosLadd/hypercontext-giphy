//
//  SearchResult.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

struct DLSearchResult: Decodable {
    
    let data: [DLGiphy]
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
    
}
