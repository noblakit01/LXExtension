//
//  UIImage.swift
//  LXExtension
//
//  Created by luan on 9/21/17.
//
//

import UIKit

extension UIImage {
    func image(with color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func cropByRect(_ rect: CGRect) -> UIImage? {
        let rectTransform : CGAffineTransform
        switch (imageOrientation) {
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
}
