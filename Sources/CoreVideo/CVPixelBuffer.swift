//
//  CVPixelBuffer.swift
//  LXExtension
//
//  Created by luantran on 12/24/18.
//

import CoreVideo

extension CVPixelBuffer {
    
    var rect: CGRect {
        return CGRect(x: 0, y: 0,
                      width: CVPixelBufferGetWidth(self),
                      height: CVPixelBufferGetHeight(self))
    }
    
}
