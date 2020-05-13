//
//  UIFont.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 1/14/18.
//

import UIKit

public extension UIFont {
    
    func height(for string: String, withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = string.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(for string: String, withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = string.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    static func logAllFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("LXExtension Family: \(family) Font names: \(names)")
        }
    }
    
}
