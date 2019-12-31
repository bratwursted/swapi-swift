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

  var sut: Planet?

  override func setUp() {
    sut = samplePlanet
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing `Planet` data model. 
  func testPlanetParsing() {
    let expectedName = "Alderaan"
    XCTAssertEqual(sut?.name, expectedName)
    let expectedRotation = "24"
    XCTAssertEqual(sut?.rotationPeriod, expectedRotation)
    let expectedOrbit = "364"
    XCTAssertEqual(sut?.orbitalPeriod, expectedOrbit)
    let expectedDiameter = "12500"
    XCTAssertEqual(sut?.diameter, expectedDiameter)
    let expectedClimate = "temperate"
    XCTAssertEqual(sut?.climate, expectedClimate)
    let expectedGravity = "1 standard"
    XCTAssertEqual(sut?.gravity, expectedGravity)
    let expectedTerrain = "grasslands, mountains"
    XCTAssertEqual(sut?.terrain, expectedTerrain)
    let expectedWater = "40"
    XCTAssertEqual(sut?.surfaceWater, expectedWater)
    let expectedPopulation = "2000000000"
    XCTAssertEqual(sut?.population, expectedPopulation)

    XCTAssertEqual(sut?.residents.count, 3)
    let expectedResidents = [
      "https://swapi.co/api/people/5/",
      "https://swapi.co/api/people/68/",
      "https://swapi.co/api/people/81/"
    ]
    XCTAssertEqual(sut?.residents[0], expectedResidents[0])
    XCTAssertEqual(sut?.residents[1], expectedResidents[1])
    XCTAssertEqual(sut?.residents[2], expectedResidents[2])

    let expectedFilms = [
      "https://swapi.co/api/films/6/",
      "https://swapi.co/api/films/1/"
    ]
    XCTAssertEqual(sut?.films, expectedFilms)

    XCTAssertEqual(sut?.url, "https://swapi.co/api/planets/2/")
  }

}
