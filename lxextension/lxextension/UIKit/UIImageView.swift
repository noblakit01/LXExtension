//
//  UIImageView.swift
//  lxextension
//
//  Created by luantran on 6/6/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public convenience init(image: UIImage) {
        self.init(frame: .zero)
        
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public convenience init(image: UIImage, contentMode: UIView.ContentMode) {
        self.init(image: image)
        
        self.contentMode = contentMode
    }
    
    public convenience init(contentMode: UIView.ContentMode) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
