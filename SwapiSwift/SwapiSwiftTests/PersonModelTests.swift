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

  var sut: Person?

  override func setUp() {
    sut = samplePerson
  }

  override func tearDown() {
    sut = nil
  }

  ///Some simple tests to validate parsing of `Person` data model
  func testPersonParsing() {
    let expectedName = "Luke Skywalker"
    XCTAssertEqual(sut?.name, expectedName)
    let expectedHeight = "172"
    XCTAssertEqual(sut?.height, expectedHeight)
    let expectedMass = "77"
    XCTAssertEqual(sut?.mass, expectedMass)
    let expectedHair = "blond"
    XCTAssertEqual(sut?.hairColor, expectedHair)
    let expectedSkin = "fair"
    XCTAssertEqual(sut?.skinColor, expectedSkin)
    let expectedEyes = "blue"
    XCTAssertEqual(sut?.eyeColor, expectedEyes)
    let expectedBirth = "19BBY"
    XCTAssertEqual(sut?.birthYear, expectedBirth)
    let expectedGender = "male"
    XCTAssertEqual(sut?.gender, expectedGender)
    let expectedHome = "https://swapi.co/api/planets/1/"
    XCTAssertEqual(sut?.homeworld, expectedHome)

    XCTAssertEqual(sut?.films.count, 5)
    let expectedFilms = [
      "https://swapi.co/api/films/2/",
      "https://swapi.co/api/films/6/",
      "https://swapi.co/api/films/3/"
    ]
    XCTAssertEqual(sut?.films[0], expectedFilms[0])
    XCTAssertEqual(sut?.films[1], expectedFilms[1])
    XCTAssertEqual(sut?.films[2], expectedFilms[2])

    XCTAssertEqual(sut?.species.count, 1)
    let expectedSpecies = ["https://swapi.co/api/species/1/"]
    XCTAssertEqual(sut?.species, expectedSpecies)

    XCTAssertEqual(sut?.vehicles.count, 2)
    let expectedVehicles = [
      "https://swapi.co/api/vehicles/14/",
      "https://swapi.co/api/vehicles/30/"
    ]
    XCTAssertEqual(sut?.vehicles, expectedVehicles)

    XCTAssertEqual(sut?.starships.count, 2)
    let expectedStarships = [
      "https://swapi.co/api/starships/12/",
      "https://swapi.co/api/starships/22/"
    ]
    XCTAssertEqual(sut?.starships, expectedStarships)
    
  }

}
