//
//  UIView+Constraints.swift
//  lxextension
//
//  Created by luantran on 5/20/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UIView {
    
    var topSafeAreaAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
    
    var bottomSafeAreaAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
    
    var trailingSafeAreaAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }
    
    var leadingSafeAreaAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }
    
    @discardableResult
    func set(autoresingMaskConstraint: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = autoresingMaskConstraint
        return self
    }
    
}

public extension UIView {
    
    @discardableResult
    func aspect(_ constant: CGFloat = 1.0) -> UIView {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(_ constant: CGFloat, constraint: inout NSLayoutConstraint?) -> Self {
        constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint!.isActive = true
        return self
    }
    
    @discardableResult
    func width(_ dimension: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(equal views: UIView...) -> UIView {
        for view in views {
            width(view.widthAnchor)
        }
        return self
    }
    
    @discardableResult
    func height(_ constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(_ dimension: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(equal views: UIView...) -> UIView {
        for view in views {
            height(view.heightAnchor)
        }
        return self
    }
    
    @discardableResult
    func leading(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(_ view: UIView, constant: CGFloat = 0.0) -> Self {
        return leading(view.leadingAnchor, constant: constant)
    }
    
    @discardableResult
    func leadingGreaterOrEqual(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func left(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailingGreaterOrEqual(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailingLessOrEqual(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailingLessOrEqual(_ view: UIView, constant: CGFloat = 0.0) -> Self {
        return trailingLessOrEqual(view.trailingAnchor, constant: constant)
    }
    
    @discardableResult
    func right(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(_ view: UIView) -> UIView {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(_ view: UIView, constraint: inout NSLayoutConstraint?) -> Self {
        constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        constraint!.isActive = true
        return self
    }
    
    @discardableResult
    func centerX(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(_ view: UIView, constant: CGFloat = 0.0) -> UIView {
        return top(view.topAnchor, constant: constant)
    }
    
    @discardableResult
    func topSafeArea(_ view: UIView, constant: CGFloat = 0.0) -> UIView {
        return top(view.topSafeAreaAnchor, constant: constant)
    }
    
    @discardableResult
    func top(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(_ view: UIView, constant: CGFloat = 0.0) -> UIView {
        return bottom(view.bottomAnchor, constant: constant)
    }
    
    @discardableResult
    func bottomSafeArea(_ view: UIView, constant: CGFloat = 0.0) -> UIView {
        return bottom(view.bottomSafeAreaAnchor, constant: constant)
    }
    
    @discardableResult
    func bottom(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottomSafeArea(_ view: UIView, constant: CGFloat = 0.0, constraint: inout NSLayoutConstraint?) -> Self {
        constraint = bottomAnchor.constraint(equalTo: view.bottomSafeAreaAnchor, constant: constant)
        constraint!.isActive = true
        return self
    }
    
    @discardableResult
    func centerY(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> Self {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(_ view: UIView) -> Self {
        return centerY(view.centerYAnchor)
    }
    
    @discardableResult
    func centerY(_ view: UIView, constraint: inout NSLayoutConstraint?) -> Self {
        constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor)
        constraint!.isActive = true
        return self
    }
    
    @discardableResult
    func fitting(_ view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func fitting(_ view: UIView, constant: CGFloat) -> UIView {
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func fittingExceptBottom(_ view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func fittingExceptTop(_ view: UIView) -> UIView {
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func fittingWidth(_ view: UIView) -> UIView {
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func fittingSafeArea(_ view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topSafeAreaAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingSafeAreaAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingSafeAreaAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomSafeAreaAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func center(_ view: UIView) -> UIView {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult
    func topRight(of view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        return self
    }
    
}
