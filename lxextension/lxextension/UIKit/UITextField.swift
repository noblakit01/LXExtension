//
//  UITextField.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 1/7/18.
//

import UIKit

public extension UITextField {
    
    convenience init(font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.textColor = textColor
    }
    
    var hadValue: Bool {
        return text != nil && text!.count > 0
    }
    
    var textOrEmpty: String {
        return text ?? ""
    }
    
}
