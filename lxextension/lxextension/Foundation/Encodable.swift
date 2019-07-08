//
//  Encodable.swift
//  lxextension
//
//  Created by luantran on 7/8/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import Foundation

public extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
}
