//
//  speedtestTests.swift
//  speedtestTests
//
//  Created by David Wagner on 10/12/2014.
//  Copyright (c) 2014 David Wagner. All rights reserved.
//

import UIKit
import XCTest

class speedtestTests: XCTestCase {

    func testSwiftJSONUsers() {
        if let json_string = self.loadJsonString() {
            let store = SwiftJSONHelperUsers(string: json_string)
            XCTAssertEqual(store.count, 8200, "Unexpected number of users decoded.")
        }
    }
    
    func testSwiftJSONUsersPerformance() {
        if let json_string = self.loadJsonString() {
            self.measureBlock() {
                let store = SwiftJSONHelperUsers(string: json_string)
            }
        }
    }

    func testSwiftUsers() {
        if let json_string = self.loadJsonString() {
            let store = SwiftUsers(string: json_string)
            XCTAssertEqual(store.count, 8200, "Unexpected number of users decoded.")
        }
    }

    func testSwiftUsersPerformance() {
        if let json_string = self.loadJsonString() {
            self.measureBlock() {
                let store = SwiftUsers(string: json_string)
            }
        }
    }
    
    func testObjCUsers() {
        if let json_string = self.loadJsonString() {
            let store = ObjCUsers(json_string)
            XCTAssertEqual(store.count, 8200, "Unexpected number of users decoded.")
        }
    }
    
    func testObjCUsersPerformance() {
        if let json_string = self.loadJsonString() {
            self.measureBlock() {
                let store = ObjCUsers(json_string)
            }
        }
    }

    private func loadJsonString() -> String? {
        if let path = NSBundle.mainBundle().pathForResource("convos", ofType: "json") {
            return String(contentsOfFile:path, encoding: NSUTF8StringEncoding, error: nil)
        } else {
            return nil
        }
    }
}
