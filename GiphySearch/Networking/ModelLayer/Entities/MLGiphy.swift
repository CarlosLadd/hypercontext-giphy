//
//  MLGiphy.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

public struct MLGiphy: Equatable {
    
    public let type: String
    public let id: String
    public let title: String
    public let images: MLImages
    
    // MARK: - Initializers
    
    public init(
        type: String,
        id: String,
        title: String,
        images: MLImages
    ) {
        self.type = type
        self.id = id
        self.title = title
        self.images = images
    }
    
}
