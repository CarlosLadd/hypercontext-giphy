//
//  DLImages.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

struct DLImages: Decodable {
    
    let fixed_height_small: DLFixedHeightSmall
    
    private enum CodingKeys: String, CodingKey {
        case fixed_height_small
    }
    
}

extension DLImages: ModelConvertible {
    
    func asModel() -> MLImages {
        
        return MLImages(fixed_height_small: MLFixedHeightSmall(height: fixed_height_small.height,
                                                               width: fixed_height_small.width,
                                                               url: fixed_height_small.url))
    }
    
}

struct DLFixedHeightSmall: Decodable {
    
    let height: String
    let width: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case height, width, url
    }
    
}
