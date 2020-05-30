//
//  UIImageView.swift
//  lxextension
//
//  Created by luantran on 6/6/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

public extension UIImageView {
    
    convenience init(image: UIImage) {
        self.init(frame: .zero)
        
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(image: UIImage, contentMode: UIView.ContentMode) {
        self.init(image: image)
        
        self.contentMode = contentMode
    }
    
    convenience init(contentMode: UIView.ContentMode) {
        self.init()
        
        self.contentMode = contentMode
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

public extension UIImageView {
    
    func convertRect(fromImageRect imageRect: CGRect, imageSize: CGSize) -> CGRect {
        let imageTopLeft = imageRect.origin
        let imageBottomRight = CGPoint(x: imageRect.maxX, y: imageRect.maxY)
        
        let viewTopLeft = convertPoint(fromImagePoint: imageTopLeft, imageSize: imageSize)
        let viewBottomRight = convertPoint(fromImagePoint: imageBottomRight, imageSize: imageSize)
        
        var viewRect : CGRect = .zero
        viewRect.origin = viewTopLeft
        viewRect.size = CGSize(width: abs(viewBottomRight.x - viewTopLeft.x), height: abs(viewBottomRight.y - viewTopLeft.y))
        return viewRect
    }
    
    func convertPoint(fromImagePoint imagePoint: CGPoint, imageSize: CGSize) -> CGPoint {
        var viewPoint = imagePoint
        let viewSize = bounds.size
        
        let ratioX = viewSize.width / imageSize.width
        let ratioY = viewSize.height / imageSize.height
        
        switch contentMode {
        case .scaleAspectFit: fallthrough
        case .scaleAspectFill:
            var scale : CGFloat = 0
            
            if contentMode == .scaleAspectFit {
                scale = min(ratioX, ratioY)
            } else {
                scale = max(ratioX, ratioY)
            }
            
            viewPoint.x *= scale
            viewPoint.y *= scale
            
            viewPoint.x += (viewSize.width  - imageSize.width  * scale) / 2.0
            viewPoint.y += (viewSize.height - imageSize.height * scale) / 2.0
        case .scaleToFill: fallthrough
        case .redraw:
            viewPoint.x *= ratioX
            viewPoint.y *= ratioY
        case .center:
            viewPoint.x += viewSize.width / 2.0  - imageSize.width  / 2.0
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
        case .top:
            viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0
        case .bottom:
            viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0
            viewPoint.y += viewSize.height - imageSize.height
        case .left:
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
        case .right:
            viewPoint.x += viewSize.width - imageSize.width
            viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
        case .topRight:
            viewPoint.x += viewSize.width - imageSize.width
        case .bottomLeft:
            viewPoint.y += viewSize.height - imageSize.height
        case .bottomRight:
            viewPoint.x += viewSize.width  - imageSize.width
            viewPoint.y += viewSize.height - imageSize.height
        case.topLeft: fallthrough
        default:
            break
        }
        
        return viewPoint
    }
    
}
