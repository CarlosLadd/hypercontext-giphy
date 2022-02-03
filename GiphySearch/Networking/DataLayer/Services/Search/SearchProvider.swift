//
//  SearchProvider.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

enum SearchProvider {

    case search(searchText: String, page: Int)

}

// MARK: - Endpoint

extension SearchProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .search:
            return "/v1/gifs/search"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var params: [String: Any]? {
        switch self {
        case .search(let searchText, let page):
            return [
                "q": searchText,
                "offset": page,
                "limit": "20"
            ]
        }
    }

    var parameterEncoding: ParameterEnconding {
        switch self {
        case .search:
            return .defaultEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }

}
