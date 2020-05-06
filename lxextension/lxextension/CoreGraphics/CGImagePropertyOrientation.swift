//
//  CGImagePropertyOrientation.swift
//  lxextension
//
//  Created by Luan Tran on 4/25/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import CoreGraphics

public extension CGImagePropertyOrientation {
    
    init(deviceOrientation: UIDeviceOrientation) {
        switch deviceOrientation {
        case .portraitUpsideDown:
            self = .rightMirrored
        case .landscapeLeft:
            self = .downMirrored
        case .landscapeRight:
            self = .upMirrored
        default:
            self = .leftMirrored
        }
    }
    
}
