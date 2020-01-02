//
//  FilmModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class FilmModelTests: XCTestCase {

  private struct ExpectedResults {
    static let title = "A New Hope"
    static let episode = 4
    static let crawl = """
It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....
"""
    static let director = "George Lucas"
    static let producer = "Gary Kurtz, Rick McCallum"
    static let url = "https://swapi.co/api/films/1/"
    static let releaseDate = "1977-05-25"
    static let characters = [
      "https://swapi.co/api/people/1/",
      "https://swapi.co/api/people/2/",
      "https://swapi.co/api/people/3/",
      "https://swapi.co/api/people/4/",
      "https://swapi.co/api/people/5/",
      "https://swapi.co/api/people/6/",
      "https://swapi.co/api/people/7/",
      "https://swapi.co/api/people/8/",
      "https://swapi.co/api/people/9/",
      "https://swapi.co/api/people/10/",
      "https://swapi.co/api/people/12/",
      "https://swapi.co/api/people/13/",
      "https://swapi.co/api/people/14/",
      "https://swapi.co/api/people/15/",
      "https://swapi.co/api/people/16/",
      "https://swapi.co/api/people/18/",
      "https://swapi.co/api/people/19/",
      "https://swapi.co/api/people/81/"
    ]
    static let planets = [
      "https://swapi.co/api/planets/2/",
      "https://swapi.co/api/planets/3/",
      "https://swapi.co/api/planets/1/"
    ]
    static let starships = [
      "https://swapi.co/api/starships/2/",
      "https://swapi.co/api/starships/3/",
      "https://swapi.co/api/starships/5/",
      "https://swapi.co/api/starships/9/",
      "https://swapi.co/api/starships/10/",
      "https://swapi.co/api/starships/11/",
      "https://swapi.co/api/starships/12/",
      "https://swapi.co/api/starships/13/"
    ]
    static let vehicles = [
      "https://swapi.co/api/vehicles/4/",
      "https://swapi.co/api/vehicles/6/",
      "https://swapi.co/api/vehicles/7/",
      "https://swapi.co/api/vehicles/8/"
    ]
    static let species = [
      "https://swapi.co/api/species/5/",
      "https://swapi.co/api/species/3/",
      "https://swapi.co/api/species/2/",
      "https://swapi.co/api/species/1/",
      "https://swapi.co/api/species/4/"
    ]
  }

  var sut: Film?

  override func setUp() {
    sut = sampleFilm
  }

  override func tearDown() {
    sut = nil
  }

  /// Some simple tests to validate parsing of `Film` data model
  func testFilmParing() {
    XCTAssertEqual(sut?.title, ExpectedResults.title)
    XCTAssertEqual(sut?.episodeId, ExpectedResults.episode)
    XCTAssertEqual(sut?.openingCrawl, ExpectedResults.crawl)
    XCTAssertEqual(sut?.director, ExpectedResults.director)
    XCTAssertEqual(sut?.producer, ExpectedResults.producer)
    XCTAssertEqual(sut?.url, ExpectedResults.url)
    XCTAssertEqual(sut?.releaseDate, ExpectedResults.releaseDate)
    XCTAssertEqual(sut?.characters, ExpectedResults.characters)
    XCTAssertEqual(sut?.planets, ExpectedResults.planets)
    XCTAssertEqual(sut?.starships, ExpectedResults.starships)
    XCTAssertEqual(sut?.vehicles, ExpectedResults.vehicles)
    XCTAssertEqual(sut?.species, ExpectedResults.species)
  }

}
