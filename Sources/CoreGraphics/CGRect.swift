//
//  CGRect.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 9/18/17.
//
//

import CoreGraphics

public func *(left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(origin: left.origin * right, size: left.size * right)
}

public func /(left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(origin: left.origin / right, size: left.size / right)
}
