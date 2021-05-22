//
//  UIColor.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 1/3/18.
//

import UIKit

public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(hex:Int, alpha: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, alpha: alpha)
    }
    
    convenience init?(aarrbbgg hexString: String) {
        var colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()
        guard colorString.count == 8 else {
            return nil
        }

        let alpha: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 0, length: 2)
        let red: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 2, length: 2)
        let green: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 4, length: 2)
        let blue: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 6, length: 2)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init?(rrbbgg hexString: String) {
        var colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()
        guard colorString.count == 6 else {
            return nil
        }

        let red: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 0, length: 2)
        let green: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 2, length: 2)
        let blue: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 4, length: 2)
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private static func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {
        
        let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
        let endIndex = colorString.index(startIndex, offsetBy: length)
        let subString = colorString[startIndex..<endIndex]
        let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
        var hexComponent: UInt32 = 0

        guard Scanner(string: String(fullHexString)).scanHexInt32(&hexComponent) else {
            return 0
        }
        let hexFloat: CGFloat = CGFloat(hexComponent)
        let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
        return floatValue
    }
    
    var aarrbbgg: String {
        let components = cgColor.components
        let r: CGFloat = components?[0] ?? 1.0
        let g: CGFloat = components?[1] ?? 1.0
        let b: CGFloat = components?[2] ?? 1.0
        let a: CGFloat = components?[3] ?? 1.0
        
        return String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(a * 255)), lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }
    
}
