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
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor) {
        self.init(text: text)
        
        self.font = font
        self.textColor = textColor
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor, numberOfLines: Int) {
        self.init(text: text, font: font, textColor: textColor)
        self.numberOfLines = numberOfLines
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) {
        self.init(text: text, font: font, textColor: textColor)
        self.textAlignment = textAlignment
    }
    
    public convenience init(text: String = "", font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment, numberOfLines: Int) {
        self.init(text: text, font: font, textColor: textColor)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    public convenience init(text: String,
                            normalAttributes: [NSAttributedString.Key : Any],
                            highlight texts: [String],
                            highlightAttributes: [NSAttributedString.Key : Any]) {
        self.init(frame: .zero)
        let attributeString = NSMutableAttributedString(string: text, attributes: normalAttributes)
        for highlightText in texts {
            guard let range = text.range(of: highlightText) else {
                continue
            }
            attributeString.addAttributes(highlightAttributes, range: NSRange(range, in: text))
        }
        self.attributedText = attributeString
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
