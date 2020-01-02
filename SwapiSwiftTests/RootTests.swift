//
//  RootTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class RootTests: XCTestCase {

  var sut: SwapiRoot?

  override func setUp() {
    sut = sampleRoot
  }

  override func tearDown() {
    sut = nil
  }

  func testRootResponse() {
    XCTAssertEqual(sut?.people, "https://swapi.co/api/people/")
    XCTAssertEqual(sut?.planets, "https://swapi.co/api/planets/")
    XCTAssertEqual(sut?.films, "https://swapi.co/api/films/")
    XCTAssertEqual(sut?.species, "https://swapi.co/api/species/")
    XCTAssertEqual(sut?.vehicles, "https://swapi.co/api/vehicles/")
    XCTAssertEqual(sut?.starships, "https://swapi.co/api/starships/")
  }
}
