//
//  UITextField.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 1/7/18.
//

import UIKit

extension UITextField {
    
    public var hadValue: Bool {
        return text != nil && text!.characters.count > 0
    }
    
}
