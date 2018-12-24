//
//  CGImage.swift
//  LXExtension
//
//  Created by luantran on 12/24/18.
//

import CoreGraphics
import CoreVideo
import CoreImage

extension CGImage {
    
    public static func from(pixelBuffer: CVPixelBuffer, context: CIContext) -> CGImage? {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        let rect = pixelBuffer.rect
        return context.createCGImage(ciImage, from: rect)
    }
    
}
