//
//  CIImage.swift
//  lxextension
//
//  Created by luantran on 5/22/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import CoreImage

extension CIImage {
    
    public func transformed(to size: CGSize) -> CIImage {
        return transformed(by: CGAffineTransform(scaleX: size.width / extent.width,
                                                 y: size.height / extent.height))
    }
    
}
