//
//  PropertyListHelper.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 31/1/22.
//

import Foundation

struct PropertyListHelper {
    
    static func decode<T: Decodable>(resourceName: String = "Info") -> T {
        
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: ".plist") else {
            
            fatalError()
            
        }
        do {
            
            let baseParameters: T = try url.decodePropertyList()
            
            return baseParameters
            
        } catch {
            
            fatalError()
            
        }
    }
    
}
