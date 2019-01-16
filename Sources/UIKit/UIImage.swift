//
//  UIImage.swift
//  LXExtension
//
//  Created by luan on 9/21/17.
//
//

import UIKit

extension UIImage {
    public var bytes: Int {
        if let data = UIImageJPEGRepresentation(self, 0.8) {
            return data.count
        }
        return 0
    }
    
    public var ratio: CGFloat {
        return size.width / size.height
    }
    
    public convenience init?(name: String?) {
        guard let name = name else {
            return nil
        }
        self.init(named: name)
    }
    
    public convenience init?(pixelBuffer: CVPixelBuffer, context: CIContext = CIContext()) {
        if let cgImage = CGImage.from(pixelBuffer: pixelBuffer, context: context) {
            self.init(cgImage: cgImage)
        } else {
            return nil
        }
    }
    
    public static func image(with color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func imageFit(with size: CGSize) -> UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        if size.width > self.size.width || size.height > self.size.height {
            return self
        }
        
        var newSize = size
        
        let bitsPerComponent = cgImage.bitsPerComponent
        let bytesPerRow = cgImage.bytesPerRow
        let colorSpace = cgImage.colorSpace
        let bitmapInfo = cgImage.bitmapInfo
        
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace!, bitmapInfo: bitmapInfo.rawValue)!
        
        context.interpolationQuality = .high
        
        switch imageOrientation {
        case .left, .leftMirrored:
            context.rotate(by: CGFloat(90).radians)
            context.translateBy(x: 0, y: -size.height)
            newSize = CGSize(width: CGFloat(size.height), height: CGFloat(size.width))
        case .right, .rightMirrored:
            context.translateBy(x: 0, y: size.height)
            context.rotate(by: CGFloat(-90).radians)
            newSize = CGSize(width: CGFloat(size.height), height: CGFloat(size.width))
        case .down, .downMirrored:
            context.translateBy(x: -size.width, y: -size.height)
            context.rotate(by: CGFloat(-180).radians)
        default:
            break
        }
        context.draw(cgImage, in: CGRect(origin: CGPoint.zero, size: newSize))
        
        
        let imageRef = context.makeImage()
        return imageRef != nil ? UIImage(cgImage: imageRef!) : nil
    }
    
    func imageFit2(with size: CGSize) -> UIImage? {
        var ratio = max(size.width / self.size.width, size.height / self.size.height) * 2
        if ratio >= 1.0 {
            return self
        }
        
        ratio = ceil(ratio * 100) / 100
        
        let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    public func crop(with rect: CGRect) -> UIImage? {
        let rectTransform : CGAffineTransform
        switch imageOrientation {
        case .left:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(90.0).radians).translatedBy(x: 0, y: -size.height)
        case .right:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(-90).radians).translatedBy(x: -size.width, y: 0)
        case .down:
            rectTransform = CGAffineTransform(rotationAngle: CGFloat(-180).radians).translatedBy(x: -size.width, y: -size.height)
        default:
            rectTransform = CGAffineTransform.identity
        }
        
        let transformedCropSquare = rect.applying(rectTransform)
        let imageRef: CGImage? = cgImage!.cropping(to: transformedCropSquare)
        
        return (imageRef != nil) ? UIImage(cgImage: imageRef!, scale: 1.0, orientation: imageOrientation): nil
    }
    
    // MARK: Resize image
    fileprivate func resize(with size: CGSize, transform: CGAffineTransform, drawTransposed: Bool, quality: CGInterpolationQuality) -> UIImage? {
        let newRect = CGRect(origin: CGPoint.zero, size: size).integral
        let transposedRect = CGRect(origin: CGPoint.zero, size: newRect.size)
        guard let imageRef = cgImage else {
            return nil
        }
        
        let width = Int(newRect.size.width)
        let height = Int(newRect.size.height)
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: imageRef.bitsPerComponent, bytesPerRow: 0, space: imageRef.colorSpace!, bitmapInfo: imageRef.bitmapInfo.rawValue)
        guard let bitmap = context else {
            return nil
        }
        
        bitmap.concatenate(transform)
        bitmap.interpolationQuality = quality
        bitmap.draw(imageRef, in: drawTransposed ? transposedRect : newRect)
        
        let newImageRef = bitmap.makeImage()
        return newImageRef != nil ? UIImage(cgImage: newImageRef!) : nil
    }
    
    public func resize(with size: CGSize, interpolationQuality: CGInterpolationQuality = .high) -> UIImage? {
        let drawTransposed = imageOrientation == .left || imageOrientation == .leftMirrored || imageOrientation == .right || imageOrientation == .rightMirrored
        
        let transform = transformForOrientation(size)
        
        return resize(with: size, transform: transform, drawTransposed: drawTransposed, quality: interpolationQuality)
    }
    
    fileprivate func transformForOrientation(_ newSize: CGSize) -> CGAffineTransform {
        var transform = CGAffineTransform.identity
        if imageOrientation == .down || imageOrientation == .downMirrored {
            transform = transform.translatedBy(x: newSize.width, y: newSize.height)
            transform = transform.rotated(by: CGFloat(180).radians)
        } else if imageOrientation == .left || imageOrientation == .leftMirrored {
            transform = transform.translatedBy(x: newSize.width, y: 0)
            transform = transform.rotated(by: CGFloat(90).radians)
        } else if imageOrientation == .right || imageOrientation == .rightMirrored {
            transform = transform.translatedBy(x: 0, y: newSize.height)
            transform = transform.rotated(by: CGFloat(-90).radians)
        }
        
        if  imageOrientation == .upMirrored || imageOrientation == .downMirrored {
            transform = transform.translatedBy(x: newSize.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        } else if imageOrientation == .leftMirrored || imageOrientation == .rightMirrored {
            transform = transform.translatedBy(x: newSize.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        }
        
        return transform
    }
    
}
