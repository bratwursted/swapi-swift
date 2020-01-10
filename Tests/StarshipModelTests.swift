//
//  StarshipModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class StarshipModelTests: XCTestCase {

  private struct ExpectedResults {
    static let name = "Executor"
    static let model = "Executor-class star dreadnought"
    static let manufacturer = "Kuat Drive Yards, Fondor Shipyards"
    static let cost = "1143350000"
    static let length = "19000"
    static let maximumAtmosphereSpeed = "n/a"
    static let crew = "279144"
    static let passengers = "38000"
    static let cargo = "250000000"
    static let consumables = "6 years"
    static let hyperdrive = "2.0"
    static let megalights = "40"
    static let starshipClass = "Star dreadnought"
    static let pilots: [String] = []
    static let films = [
      "https://swapi.co/api/films/2/",
      "https://swapi.co/api/films/3/"
    ]
    static let url = "https://swapi.co/api/starships/15/"
  }

  var sut: Starship?

  override func setUp() {
    sut = sampleStarship
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing of `Starship` model.
  func testStarshipParsing() {

    XCTAssertEqual(sut?.name, ExpectedResults.name)
    XCTAssertEqual(sut?.model, ExpectedResults.model)
    XCTAssertEqual(sut?.manufacturer, ExpectedResults.manufacturer)
    XCTAssertEqual(sut?.cost, ExpectedResults.cost)
    XCTAssertEqual(sut?.length, ExpectedResults.length)
    XCTAssertEqual(sut?.maximumAtmosphericSpeed, ExpectedResults.maximumAtmosphereSpeed)
    XCTAssertEqual(sut?.crew, ExpectedResults.crew)
    XCTAssertEqual(sut?.passengers, ExpectedResults.passengers)
    XCTAssertEqual(sut?.cargoCapacity, ExpectedResults.cargo)
    XCTAssertEqual(sut?.consumables, ExpectedResults.consumables)
    XCTAssertEqual(sut?.hyperdriveRating, ExpectedResults.hyperdrive)
    XCTAssertEqual(sut?.maximumMegalights, ExpectedResults.megalights)
    XCTAssertEqual(sut?.starshipClass, ExpectedResults.starshipClass)
    XCTAssertEqual(sut?.pilots, ExpectedResults.pilots)
    XCTAssertEqual(sut?.films, ExpectedResults.films)
    XCTAssertEqual(sut?.url, ExpectedResults.url)
  }

}
