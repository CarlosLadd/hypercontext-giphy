//
//  UIImageView+Extensions.swift
//  GiphySearch
//
//  Created by Carlos Landaverde on 2/2/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?) {
        kf.indicatorType = .activity
        kf.setImage(with: url)
    }

    func cancelImageDownload() {
        kf.cancelDownloadTask()
    }
    
}
