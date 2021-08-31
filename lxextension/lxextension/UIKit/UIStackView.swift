//
//  UIStackView.swift
//  lxextension
//
//  Created by luantran on 6/4/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

extension UIStackView {
    
    public convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        
        self.axis = axis
    }
    
    public convenience init(_ views: [UIView],
                            axis: NSLayoutConstraint.Axis = .horizontal,
                            spacing: CGFloat = 0,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public convenience init(_ views: UIView...,
        axis: NSLayoutConstraint.Axis = .horizontal,
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {
    
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

public extension UIStackView {
    
    @discardableResult
    func margins(_ margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        
        return self
    }
    
    @discardableResult
    func removeAllSubviews() -> Self {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        return self
    }
    
}
