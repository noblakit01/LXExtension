//
//  CVPixelBuffer.swift
//  LXExtension
//
//  Created by luantran on 12/24/18.
//

import CoreVideo
import Accelerate
import CoreImage

public extension CVPixelBuffer {
    
    func clamp() {
        let width = CVPixelBufferGetWidth(self)
        let height = CVPixelBufferGetHeight(self)
      
        CVPixelBufferLockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
        let floatBuffer = unsafeBitCast(CVPixelBufferGetBaseAddress(self), to: UnsafeMutablePointer<Float>.self)

        /// You might be wondering why the for loops below use `stride(from:to:step:)`
        /// instead of a simple `Range` such as `0 ..< height`?
        /// The answer is because in Swift 5.1, the iteration of ranges performs badly when the
        /// compiler optimisation level (`SWIFT_OPTIMIZATION_LEVEL`) is set to `-Onone`,
        /// which is eactly what happens when running this sample project in Debug mode.
        /// If this was a production app then it might not be worth worrying about but it is still
        /// worth being aware of.

      
        for y in stride(from: 0, to: height, by: 1) {
            for x in stride(from: 0, to: width, by: 1) {
                let pixel = floatBuffer[y * width + x]
                floatBuffer[y * width + x] = min(1.0, max(pixel, 0.0))
                
            }
        }
      
        CVPixelBufferUnlockBaseAddress(self, CVPixelBufferLockFlags(rawValue: 0))
    }
    
}

extension CVPixelBuffer {
    var rect: CGRect {
        return CGRect(x: 0, y: 0,
                      width: CVPixelBufferGetWidth(self),
                      height: CVPixelBufferGetHeight(self))
    }
}

extension CVPixelBuffer {
    
    public static func create(width: Int, height: Int) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(nil, width, height, kCVPixelFormatType_32BGRA, nil, &pixelBuffer)
        if status != kCVReturnSuccess {
            print("Error: Cannot create CVPixelBuffer with size (\(width), \(height)")
            return nil
        }
        return pixelBuffer
    }
    
}

extension CVPixelBuffer {
    
    public static func resizePixelBuffer(_ srcPixelBuffer: CVPixelBuffer,
                                         cropX: Int,
                                         cropY: Int,
                                         cropWidth: Int,
                                         cropHeight: Int,
                                         scaleWidth: Int,
                                         scaleHeight: Int) -> CVPixelBuffer? {
        let flags = CVPixelBufferLockFlags(rawValue: 0)
        guard kCVReturnSuccess == CVPixelBufferLockBaseAddress(srcPixelBuffer, flags) else {
            return nil
        }
        defer { CVPixelBufferUnlockBaseAddress(srcPixelBuffer, flags) }
        
        guard let srcData = CVPixelBufferGetBaseAddress(srcPixelBuffer) else {
            print("Error: could not get pixel buffer base address")
            return nil
        }
        let srcBytesPerRow = CVPixelBufferGetBytesPerRow(srcPixelBuffer)
        let offset = cropY*srcBytesPerRow + cropX*4
        var srcBuffer = vImage_Buffer(data: srcData.advanced(by: offset),
                                      height: vImagePixelCount(cropHeight),
                                      width: vImagePixelCount(cropWidth),
                                      rowBytes: srcBytesPerRow)
        
        let destBytesPerRow = scaleWidth*4
        guard let destData = malloc(scaleHeight*destBytesPerRow) else {
            print("Error: out of memory")
            return nil
        }
        var destBuffer = vImage_Buffer(data: destData,
                                       height: vImagePixelCount(scaleHeight),
                                       width: vImagePixelCount(scaleWidth),
                                       rowBytes: destBytesPerRow)
        
        let error = vImageScale_ARGB8888(&srcBuffer, &destBuffer, nil, vImage_Flags(0))
        if error != kvImageNoError {
            print("Error:", error)
            free(destData)
            return nil
        }
        
        let releaseCallback: CVPixelBufferReleaseBytesCallback = { _, ptr in
            if let ptr = ptr {
                free(UnsafeMutableRawPointer(mutating: ptr))
            }
        }
        
        let pixelFormat = CVPixelBufferGetPixelFormatType(srcPixelBuffer)
        var dstPixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreateWithBytes(nil, scaleWidth, scaleHeight,
                                                  pixelFormat, destData,
                                                  destBytesPerRow, releaseCallback,
                                                  nil, nil, &dstPixelBuffer)
        if status != kCVReturnSuccess {
            print("Error: could not create new pixel buffer")
            free(destData)
            return nil
        }
        return dstPixelBuffer
    }
    
    /**
     Resizes a CVPixelBuffer to a new width and height.
     */
    public static func resizePixelBuffer(_ pixelBuffer: CVPixelBuffer,
                                  width: Int, height: Int) -> CVPixelBuffer? {
        return resizePixelBuffer(pixelBuffer, cropX: 0, cropY: 0,
                                 cropWidth: CVPixelBufferGetWidth(pixelBuffer),
                                 cropHeight: CVPixelBufferGetHeight(pixelBuffer),
                                 scaleWidth: width, scaleHeight: height)
    }
    
    public func resize(to size: CGSize, context: CIContext = CIContext()) -> CVPixelBuffer? {
        guard let outputBuffer = CVPixelBuffer.create(width: Int(size.width), height: Int(size.height)) else {
            return nil
        }
        
        let ciImage = CIImage(cvPixelBuffer: self)
        let sx = size.width / CGFloat(CVPixelBufferGetWidth(self))
        let sy = size.height / CGFloat(CVPixelBufferGetHeight(self))
        let scaleTransform = CGAffineTransform(scaleX: sx, y: sy)
        let scaledImage = ciImage.transformed(by: scaleTransform)
        context.render(scaledImage, to: outputBuffer)
        return outputBuffer
    }
    
    public func resize_vImage(to size: CGSize) -> CVPixelBuffer {
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
