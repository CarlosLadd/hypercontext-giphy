//
//  MLImages.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

public struct MLImages: Equatable {
    
    let fixed_height_small: MLFixedHeightSmall
    
}

public struct MLFixedHeightSmall: Equatable {
    
    let height: String
    let width: String
    let url: String
    
}
