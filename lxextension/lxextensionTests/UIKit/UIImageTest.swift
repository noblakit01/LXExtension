//
//  UIImageTest.swift
//  LXExtension
//
//  Created by Minh Luan Tran on 12/3/17.
//

import XCTest
@testable import LXExtension

class UIImageTest: XCTestCase {
    
    func testInitOptionalName() {
        let image = UIImage(name: nil)
        XCTAssertNil(image)
    }
    
}
