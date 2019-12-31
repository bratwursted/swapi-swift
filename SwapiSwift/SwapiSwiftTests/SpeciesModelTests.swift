//
//  SpeciesModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class SpeciesModelTests: XCTestCase {

  private struct ExpectedResults {
    static let name = "Hutt"
    static let classification = "gastropod"
    static let designation = "sentient"
    static let averageHeight = "300"
    static let skinColors = "green, brown, tan"
    static let hairColors = "n/a"
    static let eyeColors = "yellow, red"
    static let lifespan = "1000"
    static let homeworld = "https://swapi.co/api/planets/24/"
    static let languiage = "Huttese"
    static let people = ["https://swapi.co/api/people/16/"]
    static var films: [String] {
      ["https://swapi.co/api/films/3/", "https://swapi.co/api/films/1/"]
    }
    static let url = "https://swapi.co/api/species/5/"
  }

  var sut: Species?

  override func setUp() {
    sut = sampleSpecies
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing a `Species` data model.
  func testSpeciesParsing() {
    XCTAssertEqual(sut?.name, ExpectedResults.name)
    XCTAssertEqual(sut?.classification, ExpectedResults.classification)
    XCTAssertEqual(sut?.designation, ExpectedResults.designation)
    XCTAssertEqual(sut?.averageHeight, ExpectedResults.averageHeight)
    XCTAssertEqual(sut?.skinColors, ExpectedResults.skinColors)
    XCTAssertEqual(sut?.hairColors, ExpectedResults.hairColors)
    XCTAssertEqual(sut?.eyeColors, ExpectedResults.eyeColors)
    XCTAssertEqual(sut?.averageLifespan, ExpectedResults.lifespan)
    XCTAssertEqual(sut?.homeworld, ExpectedResults.homeworld)
    XCTAssertEqual(sut?.language, ExpectedResults.languiage)
    XCTAssertEqual(sut?.people, ExpectedResults.people)
    XCTAssertEqual(sut?.films, ExpectedResults.films)
    XCTAssertEqual(sut?.url, ExpectedResults.url)
  }

}
