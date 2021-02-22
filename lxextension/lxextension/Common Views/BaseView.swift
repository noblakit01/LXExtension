//
//  BaseView.swift
//  lxextension
//
//  Created by Tran Minh Luan on 21/02/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import UIKit

public class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpViews()
    }
    
    func setUpViews() {
        
    }
    
}
