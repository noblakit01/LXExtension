//
//  UIView+Property.swift
//  lxextension
//
//  Created by luantran on 6/28/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func set(alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    func set(backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func set(tint color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    @discardableResult
    func set(hidden: Bool) -> Self {
        isHidden = hidden
        return self
    }
    
}
