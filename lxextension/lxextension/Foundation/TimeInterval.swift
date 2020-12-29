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
    
    var hhMMss: String {
        let secondsInt = Int(self)
        let h = secondsInt / 3600
        let remainS = secondsInt - h * 3600
        let m = remainS / 60
        let s = remainS - m * 60
        if h > 0 {
            return String(format: "%02d:%02d:%02d", h, m, s)
        } else {
            return String(format: "%02d:%02d", m, s)
        }
    }
    
}
