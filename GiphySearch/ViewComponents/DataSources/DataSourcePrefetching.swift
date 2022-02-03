//
//  DataSourcePrefetching.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import Foundation

protocol DataSourcePrefetching {
    
    var cellCount: Int { get set }
    var needsPrefetch: Bool { get set }
    var prefetchHandler: (() -> Void) { get set }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool
    
}

extension DataSourcePrefetching {
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= cellCount - 1
    }
    
    func prefetchIfNeeded(for indexPaths: [IndexPath]) {
        guard needsPrefetch else { return }
        
        if indexPaths.contains(where: isLoadingCell) {
            prefetchHandler()
        }
    }
    
}
