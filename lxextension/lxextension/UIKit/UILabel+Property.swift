//
//  UILabel+Property.swift
//  lxextension
//
//  Created by Minh Luan Tran on 6/24/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UILabel {
    
    @discardableResult
    func setMinimumScale(_ factor: CGFloat) -> UILabel {
        minimumScaleFactor = factor
        adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    func setFont(_ font: UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    @discardableResult
    func setColor(_ color: UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
    @discardableResult
    func setNumberOfLines(_ lines: Int) -> UILabel {
        numberOfLines = lines
        return self
    }
    
    @discardableResult
    func set(textAlignment: NSTextAlignment) -> UILabel {
        self.textAlignment = textAlignment
        return self
    }
    
}
