//
//  DLGiphy.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 1/2/22.
//

struct DLGiphy: Decodable {
    
    public let type: String
    public let id: String
    public let title: String
    public let images: DLImages
    
    private enum CodingKeys: String, CodingKey {
        case type, id, title, images
    }
    
    // MARK: - Initializers
    
    public init(
        type: String,
        id: String,
        title: String,
        images: DLImages
    ) {
        self.type = type
        self.id = id
        self.title = title
        self.images = images
    }
    
}

extension DLGiphy: ModelConvertible {
    
    func asModel() -> MLGiphy {
        
        return MLGiphy(type: type,
                       id: id,
                       title: title,
                       images: images.asModel())
    }
    
}
