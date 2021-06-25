//
//  CGAffineTransform.swift
//  lxextension
//
//  Created by Tran Minh Luan on 25/06/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGAffineTransform {
    
    var scale: CGFloat {
        return sqrt(a * a + c * c)
    }
    
    var rotation: CGFloat {
        return atan2(b, a)
    }
    
    var translation: CGPoint {
        return CGPoint(x: tx, y: ty)
    }
    
}
