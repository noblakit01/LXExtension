//
//  URL.swift
//  LXExtension
//
//  Created by luan on 10/7/17.
//
//

import Foundation

extension URL {
    public init?(string: String? ) {
        guard let string = string else {
            return nil
        }
        self.init(string: string)
    }
}
