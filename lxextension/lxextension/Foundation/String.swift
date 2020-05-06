//
//  String.swift
//  lxextension
//
//  Created by Luan Tran on 5/4/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
