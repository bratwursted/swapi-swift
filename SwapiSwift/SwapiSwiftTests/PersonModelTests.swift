//
//  PersonModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class PersonModelTests: XCTestCase {

  private struct ExpectedResults {
    static let name = "Luke Skywalker"
    static let height = "172"
    static let mass = "77"
    static let hairColor = "blond"
    static let skinColor = "fair"
    static let eyeColor = "blue"
    static let birthYear = "19BBY"
    static let gender = "male"
    static let homeworld = "https://swapi.co/api/planets/1/"
    static let films = [
      "https://swapi.co/api/films/2/",
      "https://swapi.co/api/films/6/",
      "https://swapi.co/api/films/3/",
      "https://swapi.co/api/films/1/",
      "https://swapi.co/api/films/7/"
    ]
    static let species = ["https://swapi.co/api/species/1/"]
    static let vehicles = [
      "https://swapi.co/api/vehicles/14/",
      "https://swapi.co/api/vehicles/30/"
    ]
    static let starships = [
      "https://swapi.co/api/starships/12/",
      "https://swapi.co/api/starships/22/"
    ]
  }

  var sut: Person?

  override func setUp() {
    sut = samplePerson
  }

  override func tearDown() {
    sut = nil
  }

  ///Some simple tests to validate parsing of `Person` data model
  func testPersonParsing() {
    XCTAssertEqual(sut?.name, ExpectedResults.name)
    XCTAssertEqual(sut?.height, ExpectedResults.height)
    XCTAssertEqual(sut?.mass, ExpectedResults.mass)
    XCTAssertEqual(sut?.hairColor, ExpectedResults.hairColor)
    XCTAssertEqual(sut?.skinColor, ExpectedResults.skinColor)
    XCTAssertEqual(sut?.eyeColor, ExpectedResults.eyeColor)
    XCTAssertEqual(sut?.birthYear, ExpectedResults.birthYear)
    XCTAssertEqual(sut?.gender, ExpectedResults.gender)
    XCTAssertEqual(sut?.homeworld, ExpectedResults.homeworld)
    XCTAssertEqual(sut?.films, ExpectedResults.films)
    XCTAssertEqual(sut?.species, ExpectedResults.species)
    XCTAssertEqual(sut?.vehicles, ExpectedResults.vehicles)
    XCTAssertEqual(sut?.starships, ExpectedResults.starships)
  }

}
