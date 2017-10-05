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
}

