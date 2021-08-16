//
//  NSAttributedString.swift
//  lxextension
//
//  Created by Tran Minh Luan on 01/03/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import Foundation

public extension NSMutableAttributedString {
    
    func add(text: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font: font,
            .foregroundColor: color
        ]
        
        self.append(NSAttributedString(string: text, attributes: attributes))
        return self
    }
    
    func add(link: String, text: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .link: link,
            .font: font
        ]
        self.append(NSAttributedString(string: text, attributes: attributes))
        return self
    }
    
    
}
