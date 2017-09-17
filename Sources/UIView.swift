//
//  UIView.swift
//  LXExtension
//
//  Created by luan on 9/17/17.
//
//

import UIKit

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    class var nib: UINib {
        get {
            return UINib(nibName: String(describing: self), bundle: nil)
        }
    }
    
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
