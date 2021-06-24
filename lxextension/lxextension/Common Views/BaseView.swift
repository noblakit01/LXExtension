//
//  BaseView.swift
//  lxextension
//
//  Created by Tran Minh Luan on 21/02/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import UIKit

open class BaseView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    
        setUpViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpViews()
    }
    
    convenience public init() {
        self.init(frame: .zero)
    }
    
    open func setUpViews() {
        
    }
    
}
