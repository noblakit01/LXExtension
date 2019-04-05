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
            
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
    }
    
}
