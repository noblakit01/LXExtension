//
//  CGRect.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 9/18/17.
//
//

import CoreGraphics

func *(left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(origin: left.origin * right, size: left.size * right)
}

func /(left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(origin: left.origin / right, size: left.size / right)
}
