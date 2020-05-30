//
//  TimeInterval.swift
//  lxextension
//
//  Created by Luan Tran on 5/27/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import Foundation

public extension TimeInterval {
    
    init(minute: Int) {
        self.init(Double(minute) * 60.0)
    }
    
    init(second: Double) {
        self.init(second)
    }
    
}
