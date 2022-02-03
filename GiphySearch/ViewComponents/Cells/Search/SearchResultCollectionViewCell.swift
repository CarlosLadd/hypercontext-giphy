//
//  SearchResultCollectionViewCell.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell, SearchResultCollectionViewCellProtocol {
    
    static let identifier = "SearchResultCollectionViewCell"
    
    var viewModel: SearchResultCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    lazy var giphyImage: UIImageView = {
        
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.isUserInteractionEnabled = false
        
        return img
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        giphyImage.image = nil
    }
    
    private func setLayout() {
        
        addSubview(giphyImage)
        
        NSLayoutConstraint.activate([
            
            giphyImage.topAnchor.constraint(equalTo: topAnchor),
            giphyImage.leftAnchor.constraint(equalTo: leftAnchor),
            giphyImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            giphyImage.rightAnchor.constraint(equalTo: rightAnchor)
            
        ])
        
    }
    
    // MARK: - Bindable
    
    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        
        if let imageURL = viewModel.imageURL {
            giphyImage.setImage(with: imageURL)
        } else {
            giphyImage.backgroundColor = .darkGray
        }
    }
    
}
