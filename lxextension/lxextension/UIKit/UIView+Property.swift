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
    func set(alpha: CGFloat) -> UIView {
        self.alpha = alpha
        return self
    }
    
}
