//
//  SearchResultsViewController.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    private var viewModel: SearchResultsViewModelProtocol
    
    weak var coordinator: SearchCoordinator?
    weak var delegate: SearchResultControllerDelegate?
    
    var searchResultView = SearchResultsView()
    var lastSearchValue = ""
    
    private var prefetchDataSource: CollectionViewDataSourcePrefetching!
    private var dataSource: CollectionViewDataSourcePaging<SearchResultCellViewModelProtocol>!
    
    // MARK: - Initializers

    init(viewModel: SearchResultsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = searchResultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindables()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        let collectionView = searchResultView.collectionView
        
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        collectionView.delegate = self
        
        let preferredHeight: CGFloat = 200.0
        let previewLayoutWidth = preferredHeight / CGFloat(1.5)
        
        let giphyLayout = VerticalFlowLayout(preferredWidth: previewLayoutWidth,
                                             preferredHeight: preferredHeight,
                                             minColumns: 3)
        
        collectionView.collectionViewLayout = giphyLayout
    }
    
    private func reloadCollectionViewData() {
        
        dataSource = CollectionViewDataSourcePaging.make(for: viewModel.searchCells)
        
        prefetchDataSource = CollectionViewDataSourcePrefetching(cellCount: viewModel.searchCells.count,
                                                                 needsPrefetch: viewModel.needsPrefetch,
                                                                 prefetchHandler: { [weak self] in
            self?.viewModel.searchGiphy(with: self?.lastSearchValue ?? "")
                                                                 })
        
        self.searchResultView.collectionView.dataSource = dataSource
        self.searchResultView.collectionView.prefetchDataSource = prefetchDataSource
        self.searchResultView.collectionView.reloadData()
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        viewModel.searchListViewState.bind({ [weak self] state in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.configureView(withState: state)
                strongSelf.reloadCollectionViewData()
            }
        })
    }

    func startSearch(withSearchText searchText: String) {
        lastSearchValue = searchText
        
        viewModel.clearSearch()
        viewModel.searchGiphy(with: searchText)
    }

    func resetSearch() {
        lastSearchValue = ""
        viewModel.clearSearch()
        
        DispatchQueue.main.async {
            self.reloadCollectionViewData()
        }
    }
    
    // MARK: - View State
    
    private func configureView(withState state: PagingViewState<MLGiphy>) {
        switch state {
        case .populated, .paging, .initial:
            self.searchResultView.collectionView.backgroundView = UIView(frame: .zero)
        case .empty:
            print("Show empty state")
        case .error(_):
            print("Show retry state")
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension SearchResultsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
    
}
