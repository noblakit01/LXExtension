//
//  UIScrollView.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 10/5/17.
//
//

import UIKit

extension UIScrollView {
    public var isReachedEnd: Bool {
        return contentOffset.y + frame.size.height >= contentSize.height
    }
    
    public func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
}
