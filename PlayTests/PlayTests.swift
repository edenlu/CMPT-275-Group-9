//
//  PlayTests.swift
//  PlayTests
//
//  Created by Xdimension Studio on 2016-10-17.
//  Copyright © 2016 NEDEUI. All rights reserved.
//

import XCTest
@testable import Play

class PlayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGameOne() {
        // Hit main button on game one
        // Assert output on next screen is "<proper output>"
        // buttonObj.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        // numTap.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        // XCTAssertEqual(ourOutput, <proper output>, "Testing proper output")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
