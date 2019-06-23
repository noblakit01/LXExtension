//
//  UILabel+Property.swift
//  lxextension
//
//  Created by Minh Luan Tran on 6/24/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

extension UILabel {
    
    @discardableResult
    public func setMinimumScale(_ factor: CGFloat) -> UIView {
        minimumScaleFactor = factor
        adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont) -> UIView {
        self.font = font
        return self
    }
    
    @discardableResult
    public func setColor(_ color: UIColor) -> UIView {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func setNumberOfLines(_ lines: Int) -> UIView {
        numberOfLines = lines
        return self
    }
    
}
