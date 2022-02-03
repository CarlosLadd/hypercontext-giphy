//
//  URLRequest+Extensions.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import Foundation

extension URLRequest {

    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }

    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }

}
