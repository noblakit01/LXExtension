//
//  UIButton.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 2/24/19.
//

import UIKit

extension UIButton {
    
    public func adjustContentOffset() {
        let spacing: CGFloat = 4.0
        
        if let imageView = imageView,
            let titleLabel = titleLabel {
            let imageSize = imageView.frame.size
            let titleSize = titleLabel.frame.size
            
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(imageSize.height + spacing), 0)
            imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0, 0, -titleSize.width)
        }
    }
    
}
