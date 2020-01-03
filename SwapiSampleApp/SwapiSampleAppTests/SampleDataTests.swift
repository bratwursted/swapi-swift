//
//  SampleDataTests.swift
//  SwapiSampleAppTests
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import XCTest
import SwapiSwift
@testable import SwapiSampleApp

class SampleDataTests: XCTestCase {

  var sut: MockGraphDataService.DataStore?

  override func setUp() {
    sut = newHopeData
  }

  override func tearDown() {
    sut = nil
  }

  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

}
