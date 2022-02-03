//
//  BaseConfig.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

struct BaseConfig: Decodable {
    
    struct Keys: Decodable {
        
        let apiKey: String
        
        private enum CodingKeys: String, CodingKey {
            case apiKey = "ApiKey"
        }
        
    }
    
    let keys: Keys
    
    private enum CodingKeys: String, CodingKey {
        case keys = "GiphySearch"
    }
    
}
