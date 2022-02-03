//
//  PagingViewStateProcessable.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import Foundation

protocol PagingViewStateProcessable {

    func processResult<T: Equatable>(_ entities: [T]) -> PagingViewState<T>

    func processResult<T: Equatable>(_ entities: [T],
                                     currentPage: Int,
                                     currentEntities: [T]) -> PagingViewState<T>

}

extension PagingViewStateProcessable {

    func processResult<T: Equatable>(_ entities: [T]) -> PagingViewState<T> {
        return entities.isEmpty ? .empty : .populated(entities)
    }

    func processResult<T: Equatable>(_ entities: [T],
                                     currentPage: Int,
                                     currentEntities: [T]) -> PagingViewState<T> {
        var allEntities = currentPage == 1 ? [] : currentEntities
        allEntities.append(contentsOf: entities)
        guard !allEntities.isEmpty else { return .empty }

        return entities.isEmpty ? .populated(allEntities) : .paging(allEntities, next: currentPage + 1)
    }

}
