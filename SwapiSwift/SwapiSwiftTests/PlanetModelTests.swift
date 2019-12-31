//
//  PlanetModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class PlanetModelTests: XCTestCase {

  private struct ExpectedResults {
    static let name = "Alderaan"
    static let rotationPeriod = "24"
    static let orbitalPeriod = "364"
    static let diameter = "12500"
    static let climate = "temperate"
    static let gravity = "1 standard"
    static let terrain = "grasslands, mountains"
    static let surfaceWater = "40"
    static let population = "2000000000"
    static let residents = [
      "https://swapi.co/api/people/5/",
      "https://swapi.co/api/people/68/",
      "https://swapi.co/api/people/81/"
    ]
    static let films = [
      "https://swapi.co/api/films/6/",
      "https://swapi.co/api/films/1/"
    ]
    static let url = "https://swapi.co/api/planets/2/"
  }

  var sut: Planet?

  override func setUp() {
    sut = samplePlanet
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing `Planet` data model. 
  func testPlanetParsing() {
    XCTAssertEqual(sut?.name, ExpectedResults.name)
    XCTAssertEqual(sut?.rotationPeriod, ExpectedResults.rotationPeriod)
    XCTAssertEqual(sut?.orbitalPeriod, ExpectedResults.orbitalPeriod)
    XCTAssertEqual(sut?.diameter, ExpectedResults.diameter)
    XCTAssertEqual(sut?.climate, ExpectedResults.climate)
    XCTAssertEqual(sut?.gravity, ExpectedResults.gravity)
    XCTAssertEqual(sut?.terrain, ExpectedResults.terrain)
    XCTAssertEqual(sut?.surfaceWater, ExpectedResults.surfaceWater)
    XCTAssertEqual(sut?.population, ExpectedResults.population)
    XCTAssertEqual(sut?.residents, ExpectedResults.residents)
    XCTAssertEqual(sut?.films, ExpectedResults.films)
    XCTAssertEqual(sut?.url, ExpectedResults.url)
  }

}
