//
//  Codable.swift
//  lxextension
//
//  Created by Tran Minh Luan on 11/10/20.
//  Copyright © 2020 luantran. All rights reserved.
//

import Foundation

public protocol Imitable: Codable {
    var copy: Self? { get }
}

extension Imitable {
    
    public var copy: Self? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return try? JSONDecoder().decode(Self.self, from: data)
    }
    
}
