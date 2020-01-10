//
//  VehicleModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class VehicleModelTests: XCTestCase {

  private struct ExpectedResults {
    static let name = "Sand Crawler"
    static let model = "Digger Crawler"
    static let manufacturer = "Corellia Mining Corporation"
    static let cost = "150000"
    static let length = "36.8"
    static let maximumSpeed = "30"
    static let crew = "46"
    static let passengers = "30"
    static let cargo = "50000"
    static let consumables = "2 months"
    static let vehicleClass = "wheeled"
    static let pilots: [String] = []
    static let films = [
      "https://swapi.co/api/films/5/",
      "https://swapi.co/api/films/1/"
    ]
    static let url = "https://swapi.co/api/vehicles/4/"
  }

  var sut: Vehicle?

  override func setUp() {
    sut = sampleVehicle
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing `Vehicle` data model.
  func testVehicleParsing() {
    XCTAssertEqual(sut?.name, ExpectedResults.name)
    XCTAssertEqual(sut?.model, ExpectedResults.model)
    XCTAssertEqual(sut?.manufacturer, ExpectedResults.manufacturer)
    XCTAssertEqual(sut?.cost, ExpectedResults.cost)
    XCTAssertEqual(sut?.length, ExpectedResults.length)
    XCTAssertEqual(sut?.maximumAtmosphericSpeed, ExpectedResults.maximumSpeed)
    XCTAssertEqual(sut?.crew, ExpectedResults.crew)
    XCTAssertEqual(sut?.passengers, ExpectedResults.passengers)
    XCTAssertEqual(sut?.cargoCapacity, ExpectedResults.cargo)
    XCTAssertEqual(sut?.consumables, ExpectedResults.consumables)
    XCTAssertEqual(sut?.vehicleClass, ExpectedResults.vehicleClass)
    XCTAssertEqual(sut?.pilots, ExpectedResults.pilots)
    XCTAssertEqual(sut?.films, ExpectedResults.films)
    XCTAssertEqual(sut?.url, ExpectedResults.url)
  }

}
