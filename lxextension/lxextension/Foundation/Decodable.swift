//
//  Decodable.swift
//  lxextension
//
//  Created by luantran on 7/8/19.
//  Copyright © 2019 luantran. All rights reserved.
//

import Foundation

public extension Decodable {
    init(from: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
