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
        do {
            let data = try JSONSerialization.data(withJSONObject: from, options: [])
            let decoder = JSONDecoder()
            do {
                self = try decoder.decode(Self.self, from: data)
            } catch (let error) {
                print("Luan Decodable \(error)")
                throw error
            }
        } catch (let error) {
            print("Luan Decodable \(error)")
            throw error
        }
    }
    
}
