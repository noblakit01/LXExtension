//
//  FloatingPoint.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 12/5/17.
//

import Foundation

extension FloatingPoint {
    
    public var radians: Self {
        return self * .pi / 180
    }
    
    public var degrees: Self {
        return self * 180 / .pi
    }
    
}
