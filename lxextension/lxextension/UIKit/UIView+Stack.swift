//
//  UIView+Stack.swift
//  lxextension
//
//  Created by luantran on 6/4/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func stack(_ axis: NSLayoutConstraint.Axis, views: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.fitting(self)
        return stackView
    }
    
    @discardableResult
    public func hStack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return stack(.horizontal, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
    @discardableResult
    public func vStack(_ views: UIView..., spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> UIStackView {
        return stack(.vertical, views: views, spacing: spacing, alignment: alignment, distribution: distribution)
    }
    
}
