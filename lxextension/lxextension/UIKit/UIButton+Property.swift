//
//  UIButton+Property.swift
//  lxextension
//
//  Created by Minh Luan Tran on 7/2/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UIButton {
    
    @discardableResult
    func horizontal(_ spacing: CGFloat = 0.0) -> Self {
        if let imageView = imageView,
            let titleLabel = titleLabel {
            let imageSize = imageView.frame.size
            let titleSize = titleLabel.frame.size
            
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
        return self
    }
    
    @discardableResult
    func setInsets(for contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat) -> UIButton {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
        return self
    }
    
    @discardableResult
    func set(_ font: UIFont) -> UIButton {
        titleLabel?.setFont(font)
        return self
    }
    
    @discardableResult
    func set(_ titleColor: UIColor) -> UIButton {
        setTitleColor(titleColor, for: .normal)
        return self
    }
    
}
