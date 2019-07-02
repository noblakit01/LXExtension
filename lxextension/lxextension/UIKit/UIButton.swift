//
//  UIButton.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 2/24/19.
//

import UIKit

public extension UIButton {
    
    func adjustContentOffset() {
        let spacing: CGFloat = 4.0
        
        if let imageView = imageView,
            let titleLabel = titleLabel {
            let imageSize = imageView.frame.size
            let titleSize = titleLabel.frame.size
            
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
    }
    
    convenience init(type: UIButton.ButtonType, text: String, titleFont: UIFont, titleColor: UIColor) {
        self.init(type: type)
        
        setTitle(text, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(text: String, titleFont: UIFont, titleColor: UIColor, contentInsets: UIEdgeInsets = UIEdgeInsets.zero) {
        self.init(type: .system)
        
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = titleFont
        
        contentEdgeInsets = contentInsets
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(image: UIImage, type: UIButton.ButtonType = UIButton.ButtonType.system, contentInsets: UIEdgeInsets = UIEdgeInsets.zero) {
        self.init(type: type, text: "", image: image)
        
        contentEdgeInsets = contentInsets
    }
    
    convenience init(type: UIButton.ButtonType = UIButton.ButtonType.system, text: String = "", image: UIImage? = nil) {
        self.init(type: type)
        
        setTitle(text, for: .normal)
        setImage(image, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
