//
//  UILabel.swift
//  lxextension
//
//  Created by luantran on 6/4/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import UIKit

extension UILabel {
    
    public convenience init(text: String) {
        self.init(frame: .zero)
        
        self.text = text
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor) {
        self.init(text: text)
        
        self.font = font
        self.textColor = textColor
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) {
        self.init(text: text, font: font, textColor: textColor)
        self.textAlignment = textAlignment
    }
    
}
