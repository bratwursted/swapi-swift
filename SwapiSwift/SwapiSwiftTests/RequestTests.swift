//
//  RequestTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class RequestTests: XCTestCase {

  var sut: Request?

  private let filmsConfig = RequestConfiguration(resource: .films)
  private let peopleConfig = RequestConfiguration(resource: .people)
  private let baseConfig = RequestConfiguration()

  override func tearDown() {
    sut = nil
  }

  func testResourceRoot() {
    sut = Request(config: filmsConfig)
    XCTAssertNotNil(sut?.url)
    let expectedUrl = URL(string: "https://swapi.co/api/films/")
    XCTAssertEqual(sut?.url, expectedUrl)
  }

  func testResourceId() {
    let resourceId = "1"
    sut = Request(config: peopleConfig, resourceId: resourceId)
    let resourceUrl = sut?.url
    XCTAssertNotNil(resourceUrl)
    let expectedUrl = URL(string: "https://swapi.co/api/people/1/")
    XCTAssertEqual(resourceUrl, expectedUrl)
  }

  func testBaseUrl() {
    sut = Request(config: baseConfig)
    XCTAssertNotNil(sut?.url)
    let expectedUrl = URL(string: "https://swapi.co/api/")
    XCTAssertEqual(sut?.url, expectedUrl)
  }

  func testRequestUrl() {
    let url = "https://swapi.co/api/planets/2/"
    sut = Request(resourceUrl: url)
    XCTAssertNotNil(sut?.url)
    XCTAssertEqual(sut?.url, URL(string: url))
  }
}
