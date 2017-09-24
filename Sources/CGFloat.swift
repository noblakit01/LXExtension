//
//  CGFloat.swift
//  LXExtension
//
//  Created by luan on 9/21/17.
//
//

import CoreGraphics

extension CGFloat {
    public var radians: CGFloat {
        return self * CGFloat(Float.pi) / 180.0
    }
}
