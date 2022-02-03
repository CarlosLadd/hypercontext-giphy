//
//  CharacterSet+Extensions.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation

extension CharacterSet {

    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        
        return allowed
    }()

}
