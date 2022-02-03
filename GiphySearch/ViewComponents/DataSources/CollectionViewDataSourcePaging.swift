//
//  CollectionViewDataSourcePaging.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import UIKit

final class CollectionViewDataSourcePaging<ViewModel>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UICollectionViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }

}

// MARK: - SearchResultCellViewModelProtocol

extension CollectionViewDataSourcePaging where ViewModel == SearchResultCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel]) -> CollectionViewDataSourcePaging {
        return CollectionViewDataSourcePaging(cellViewModels: cellViewModels,
                                              reuseIdentifier: SearchResultCollectionViewCell.identifier,
                                              cellConfigurator: { (viewModel, cell) in
                                                var cell = cell as! SearchResultCollectionViewCellProtocol
                                                cell.viewModel = viewModel
        })
    }
    
}
