//
//  UITextField+Property.swift
//  lxextension
//
//  Created by Tran Minh Luan on 10/13/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import UIKit

public extension UITextField {
    
    @discardableResult
    func setPlaceholder(text: String) -> Self {
        placeholder = text
        return self
    }
    
}

