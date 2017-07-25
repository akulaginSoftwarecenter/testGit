//
//  RNISTests.swift
//  RNISTests
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import XCTest
@testable import RNIS

class RNISTests: XCTestCase {
       
    func testLogin() {
        let expectation = self.expectation(description: "asynchronous request RNSPostLogin")
        RNSPostLogin { (reply, error, _) in
            XCTAssertTrue(reply != nil, "token is missing")
            XCTAssertTrue(error == nil, "error login")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 50)
    }
    
    func testGetTraffic() {
        let expectation = self.expectation(description: "asynchronous request RNSGetTraffic")
        let minCoord = PGGeoPoint(latitude: 59.83948789844581, longitude: 30.142203284910988)
        let maxCoord = PGGeoPoint(latitude: 60.029367157372164, longitude: 30.355406715088993)
        let zoom = Int32(13)
        RNSGetTraffic(minCoord: minCoord, maxCoord: maxCoord, zoom: zoom) {(reply, error, handleError) in
            let value =  reply as? Int ?? -1
            let errorBool = (-1 <= value) && (value <= 10)
            print("errorBool",errorBool)
            XCTAssertTrue(errorBool, "RNSGetTraffic not valid")
            XCTAssertTrue(error == nil, "error login")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20)
    }
}
