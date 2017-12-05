//
//  FloatingPointTest.swift
//  LXExtensionTests
//
//  Created by Minh Luan Tran on 12/5/17.
//

import XCTest
@testable import LXExtension

class FloatingPointTest: XCTestCase {
    
    func test180ToRadians() {
        let radians = (180.0).radians
        XCTAssertTrue(radians == .pi)
    }
    
    func testPiToDegrees() {
        let degrees = Double.pi.degrees
        XCTAssertTrue(degrees == 180.0)
    }
    
}


