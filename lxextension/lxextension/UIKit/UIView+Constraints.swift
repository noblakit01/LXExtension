//
//  UIView+Constraints.swift
//  lxextension
//
//  Created by luantran on 5/20/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
extension UIView {
    
    public var topSafeAreaAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }
    
    public var bottomSafeAreaAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    public var trailingSafeAreaAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.trailingAnchor
    }
    
    public var leadingSafeAreaAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leadingAnchor
    }
}

extension UIView {
    
    @discardableResult
    public func aspect(_ constant: CGFloat = 1.0) -> UIView {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ dimension: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func height(_ dimension: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func leading(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func left(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func trailing(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func right(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerX(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func top(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func bottom(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerY(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> UIView {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func fitting(_ view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return self
    }
    
    @discardableResult
    public func fitting(_ view: UIView, constant: CGFloat) -> UIView {
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
    @discardableResult
    public func fittingExceptBottom(_ view: UIView) -> UIView {
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        return self
    }
    
    @discardableResult
    public func fittingExceptTop(_ view: UIView) -> UIView {
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return self
    }
    
    @discardableResult
    public func center(_ view: UIView) -> UIView {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
    
}
