//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResponses() throws {
        let weatherService = WeatherService.shared
        let icons = weatherService.icons
        let json = weatherService.json
        
        XCTAssertNotNil(icons)
        XCTAssertNoThrow(json)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
