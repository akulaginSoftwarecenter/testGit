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
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostLogin")
        RNSPostLogin { (reply, error, _) in
            XCTAssertTrue(reply != nil, "token is missing")
            XCTAssertTrue(error == nil, "error login")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testRegister() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostRegister")
        RNSPostRegister { (reply, error, _) in
            XCTAssertTrue(error == nil, "error register")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testConfirmSend() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostConfirmSend")
        RNSPostConfirmSend { (reply, error, _) in
            XCTAssertTrue(error == nil, "error confirm_send")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testConfirmCheck() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostConfirmCheck")
        RNSPostConfirmCheck { (reply, error, _) in
            XCTAssertTrue(error == nil, "error confirm_check")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testContactList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostContactList")
        RNSPostContactList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error contact_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testMobilePageGet() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostMobilePageGet")
        RNSPostMobilePageGet { (reply, error, _) in
            XCTAssertTrue(error == nil, "error mobile_page_get")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testUserGet() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostUserGet")
        RNSPostUserGet { (reply, error, _) in
            XCTAssertTrue(error == nil, "error user_get")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testLogout() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostLogout")
        RNSPostLogout { (reply, error, _) in
            XCTAssertTrue(error == nil, "error logout")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testLogout() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostLogout")
        RNSPostLogout { (reply, error, _) in
            XCTAssertTrue(error == nil, "error logout")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testStopPointList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostStopPointList")
        RNSPostStopPointList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error stop_point_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testUpdate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostUpdate")
        RNSPostUpdate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error update")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testStopPointRoutes() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSStopPointRoutes")
        RNSStopPointRoutes { (reply, error, _) in
            XCTAssertTrue(error == nil, "error stop_point_routes")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testPhoneConfirmCheck() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostPhoneConfirmCheck")
        RNSPostPhoneConfirmCheck { (reply, error, _) in
            XCTAssertTrue(error == nil, "error phone_confirm_check")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testPhoneConfirmSend() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostPhoneConfirmSend")
        RNSPostPhoneConfirmSend { (reply, error, _) in
            XCTAssertTrue(error == nil, "error phone_confirm_send")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testComplaint() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostComplaint")
        RNSPostComplaint { (reply, error, _) in
            XCTAssertTrue(error == nil, "error complaint")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFeedback() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFeedback")
        RNSPostFeedback { (reply, error, _) in
            XCTAssertTrue(error == nil, "error feedback")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoriteRouteCreate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoriteRouteCreate")
        RNSPostFavoriteRouteCreate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_route_create")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoriteRouteDelete() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoriteRouteDelete")
        RNSPostFavoriteRouteDelete { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_route_delete")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoriteRouteList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoriteRouteList")
        RNSPostFavoriteRouteList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_route_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testBusList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostBusList")
        RNSPostBusList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error bus_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testNotificationList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostNotificationList")
        RNSPostNotificationList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error notification_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testNotificationCreate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostNotificationCreate")
        RNSPostNotificationCreate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error notification_create")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testNotificationUpdate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostNotificationUpdate")
        RNSPostNotificationUpdate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error notification_update")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testNotificationDelete() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostNotificationDelete")
        RNSPostNotificationDelete { (reply, error, _) in
            XCTAssertTrue(error == nil, "error notification_delete")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testBusGet() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostBusGet")
        RNSPostBusGet { (reply, error, _) in
            XCTAssertTrue(error == nil, "error bus_get")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoritePathList() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoritePathList")
        RNSPostFavoritePathList { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_path_list")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoritePathCreate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoritePathCreate")
        RNSPostFavoritePathCreate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_path_create")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoritePathDelete() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoritePathDelete")
        RNSPostFavoritePathDelete { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_path_delete")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testFavoritePathUpdate() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostFavoritePathUpdate")
        RNSPostFavoritePathUpdate { (reply, error, _) in
            XCTAssertTrue(error == nil, "error favorite_path_update")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testSearch() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostSearch")
        RNSPostSearch { (reply, error, _) in
            XCTAssertTrue(error == nil, "error search")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 50)
    }
    
    func testGetTraffic() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSGetTraffic")
        let minCoord = PGGeoPoint(latitude: 59.83948789844581, longitude: 30.142203284910988)
        let maxCoord = PGGeoPoint(latitude: 60.029367157372164, longitude: 30.355406715088993)
        let zoom = Int32(13)
        RNSGetTraffic(minCoord: minCoord, maxCoord: maxCoord, zoom: zoom) {(reply, error, _) in
            let value =  reply as? Int ?? -1
            let errorBool = (-1 <= value) && (value <= 10)
            print("errorBool",errorBool)
            XCTAssertTrue(errorBool, "RNSGetTraffic not valid")
            XCTAssertTrue(error == nil, "error traffic")
            expectation?.fulfill()
            expectation = nil
        }
        waitForExpectations(timeout: 20)
    }
    
    func testPostRouting() {
        var expectation: XCTestExpectation? = self.expectation(description: "asynchronous request RNSPostRouting")
        RNSPostRouting(complete:  { (reply, error, _) in
            XCTAssertTrue(reply != nil, "route is missing")
            XCTAssertTrue(error == nil, "error Routing")
            expectation?.fulfill()
            expectation = nil
        })
        waitForExpectations(timeout: 50)
    }
}
