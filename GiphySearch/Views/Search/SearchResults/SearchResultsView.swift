//
//  SearchResultsView.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import UIKit

class SearchResultsView: UIView {
    
    lazy var collectionView: UICollectionView = {

        let layout =  UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.preservesSuperviewLayoutMargins = true
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.accessibilityIdentifier = "collection_view_search_giphy"
        
        return collection
    }()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        backgroundColor = .white
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}
