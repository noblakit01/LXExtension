//
//  CVPixelBuffer.swift
//  LXExtension
//
//  Created by luantran on 12/24/18.
//

import CoreVideo
import Accelerate

extension CVPixelBuffer {
    
    var rect: CGRect {
        return CGRect(x: 0, y: 0,
                      width: CVPixelBufferGetWidth(self),
                      height: CVPixelBufferGetHeight(self))
    }
    
    public func resize(to size: CGSize) -> CVPixelBuffer {
        var format = vImage_CGImageFormat(bitsPerComponent: 8,
                                          bitsPerPixel: 32,
                                          colorSpace: nil,
                                          bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.last.rawValue),
                                          version: 0,
                                          decode: nil,
                                          renderingIntent: .defaultIntent)
        let inputCVImageFormat = vImageCVImageFormat_CreateWithCVPixelBuffer(self).takeRetainedValue()
        var error = kvImageNoError
        error = vImageCVImageFormat_SetColorSpace(inputCVImageFormat,
                                          CGColorSpaceCreateDeviceRGB())
        guard error == kvImageNoError else {
            fatalError("Error in vImageCVImageFormat_SetColorSpace: \(error)")
        }
        var sourceBuffer = vImage_Buffer()
        error = vImageBuffer_InitWithCVPixelBuffer(&sourceBuffer,
                                           &format,
                                           self,
                                           inputCVImageFormat,
                                           nil,
                                           vImage_Flags(kvImageNoFlags))
        guard error == kvImageNoError else {
            fatalError("Error in vImageBuffer_InitWithCVPixelBuffer: \(error)")
        }
        
        var destinationBuffer = vImage_Buffer()
        error = vImageBuffer_Init(&destinationBuffer,
                                  vImagePixelCount(size.height),
                                  vImagePixelCount(size.width),
                                  format.bitsPerPixel,
                                  vImage_Flags(kvImageNoFlags))
        guard error == kvImageNoError else {
            fatalError("Error in vImageBuffer_Init: \(error)")
        }
        error = vImageScale_ARGB8888(&sourceBuffer,
                                     &destinationBuffer,
                                     nil,
                                     vImage_Flags(kvImageHighQualityResampling))
        guard error == kvImageNoError else {
            fatalError("Error in vImageScale_ARGB8888: \(error)")
        }
        
        let outputCVImageFormat = vImageCVImageFormat_CreateWithCVPixelBuffer(self).takeRetainedValue()
        vImageCVImageFormat_SetColorSpace(outputCVImageFormat,
                                          CGColorSpaceCreateDeviceRGB())
        error = vImageBuffer_CopyToCVPixelBuffer(&destinationBuffer,
                                                 &format,
                                                 self,
                                                 outputCVImageFormat,
                                                 nil,
                                                 vImage_Flags(kvImageNoFlags))
        
        guard error == kvImageNoError else {
            fatalError("Error in vImageScale_ARGB8888: \(error)")
        }
        
        free(sourceBuffer.data)
        free(destinationBuffer.data)
        
        return self
    }
    
}
