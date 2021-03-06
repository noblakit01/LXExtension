//
//  UIView+Priority.swift
//  lxextension
//
//  Created by luantran on 6/7/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func setCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> UIView {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    func setHugging(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> UIView {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    
}
