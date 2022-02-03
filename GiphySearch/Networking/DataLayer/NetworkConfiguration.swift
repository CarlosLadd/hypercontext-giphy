//
//  NetworkConfiguration.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

final class NetworkConfiguration {

    static let shared = NetworkConfiguration()

    private(set) var apiKey = ""

    var baseAPIURLString: String {
        return "api.giphy.com"
    }

    init() {}

    func configure(with apiKey: String) {
        self.apiKey = apiKey
    }

}
