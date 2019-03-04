//
//  MLModel.swift
//  LXExtension
//
//  Created by luantran on 3/4/19.
//

import CoreML


@available(iOS 11.0, *)
extension MLModel {
    
    public convenience init?(resourceName: String) throws {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "mlmodelc") else {
            return nil
        }
        try self.init(contentsOf: url)
    }
    
}
