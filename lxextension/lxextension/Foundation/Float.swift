//
//  Float.swift
//  lxextension
//
//  Created by Tran Minh Luan on 1/4/21.
//  Copyright © 2021 luantran. All rights reserved.
//

import Foundation

public extension Float {
    
    func round(to places: Int) -> Float {
        let divisor = powf(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
}
