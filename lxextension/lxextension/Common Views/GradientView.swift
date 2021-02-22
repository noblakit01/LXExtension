//
//  GradientView.swift
//  lxextension
//
//  Created by Tran Minh Luan on 21/02/2021.
//  Copyright © 2021 luantran. All rights reserved.
//

import UIKit

public class GradientView: BaseView {
    
    public let gradientLayer = CAGradientLayer()
    
    public override var bounds: CGRect {
        didSet {
            gradientLayer.frame = bounds
        }
    }
    
    var startPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            gradientLayer.startPoint = startPoint
        }
    }
    var endPoint = CGPoint(x: 1.0, y: 1.0) {
        didSet {
            gradientLayer.endPoint = endPoint
        }
    }
    var colors = [CGColor]() {
        didSet {
            gradientLayer.colors = colors
        }
    }
    
    public convenience init(startPoint: CGPoint, endPoint: CGPoint, colors: [CGColor]) {
        self.init(frame: .zero)
        
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.colors = colors
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.shouldRasterize = true
        gradientLayer.colors = colors
        
        gradientLayer.frame = bounds
    }
    
    override func setUpViews() {
        super.setUpViews()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.shouldRasterize = true
        gradientLayer.colors = colors
        
        gradientLayer.frame = bounds
        
        layer.addSublayer(gradientLayer)
    }
    
}
