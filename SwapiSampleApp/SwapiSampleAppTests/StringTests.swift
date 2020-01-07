//
//  StringTests.swift
//  SwapiSampleAppTests
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSampleApp

class StringTests: XCTestCase {

  let testValues = [1, 2, 5, 6, 9, 10]

  let expectedValues = ["I", "II", "V", "VI", "IX", "X"]

  func testRomanConverter() {

    for (index, value) in testValues.enumerated() {
      XCTAssertEqual(value.romanNumeral, expectedValues[index])
    }
  }

}
