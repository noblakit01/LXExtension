//
//  UIFont.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 1/14/18.
//

import UIKit

extension UIFont {
    
    func height(for string: String, withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = string.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(for string: String, withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = string.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}
