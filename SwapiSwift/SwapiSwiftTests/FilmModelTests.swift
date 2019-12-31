//
//  FilmModelTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

// Some simple tests to validate parsing of `Film` data model

class FilmModelTests: XCTestCase {

  var sut: Film?

  override func setUp() {
    sut = sampleFilm
  }

  override func tearDown() {
    sut = nil
  }

  func testFilmParing() {
    let expectedTitle = "A New Hope"
    XCTAssertEqual(sut?.title, expectedTitle)
    let expectedEpisode = 4
    XCTAssertEqual(sut?.episodeId, expectedEpisode)
    let expectedCrawl = """
It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....
"""
    XCTAssertEqual(sut?.openingCrawl, expectedCrawl)
    let expectedDirector = "George Lucas"
    XCTAssertEqual(sut?.director, expectedDirector)
    let expectedProducer = "Gary Kurtz, Rick McCallum"
    XCTAssertEqual(sut?.producer, expectedProducer)
    let expectedUrl = "https://swapi.co/api/films/1/"
    XCTAssertEqual(sut?.url, expectedUrl)
    let expectedRelease = "1977-05-25"
    XCTAssertEqual(sut?.releaseDate, expectedRelease)

    XCTAssertEqual(sut?.characters.count, 18)
    let expectedCharacters = [
      "https://swapi.co/api/people/1/",
      "https://swapi.co/api/people/2/",
      "https://swapi.co/api/people/3/"
    ]
    XCTAssertEqual(sut?.characters[0], expectedCharacters[0])
    XCTAssertEqual(sut?.characters[1], expectedCharacters[1])
    XCTAssertEqual(sut?.characters[2], expectedCharacters[2])

    XCTAssertEqual(sut?.planets.count, 3)
    let expectedPlanets = [
      "https://swapi.co/api/planets/2/",
      "https://swapi.co/api/planets/3/",
      "https://swapi.co/api/planets/1/"
    ]
    XCTAssertEqual(sut?.planets[0], expectedPlanets[0])
    XCTAssertEqual(sut?.planets[1], expectedPlanets[1])
    XCTAssertEqual(sut?.planets[2], expectedPlanets[2])

    XCTAssertEqual(sut?.starships.count, 8)
    let expectedStarships = [
      "https://swapi.co/api/starships/2/",
      "https://swapi.co/api/starships/3/",
      "https://swapi.co/api/starships/5/"
    ]
    XCTAssertEqual(sut?.starships[0], expectedStarships[0])
    XCTAssertEqual(sut?.starships[1], expectedStarships[1])
    XCTAssertEqual(sut?.starships[2], expectedStarships[2])

    XCTAssertEqual(sut?.vehicles.count, 4)
    let expectedVehicles = [
      "https://swapi.co/api/vehicles/4/",
      "https://swapi.co/api/vehicles/6/",
      "https://swapi.co/api/vehicles/7/",
      "https://swapi.co/api/vehicles/8/"
    ]
    XCTAssertEqual(sut?.vehicles[0], expectedVehicles[0])
    XCTAssertEqual(sut?.vehicles[1], expectedVehicles[1])
    XCTAssertEqual(sut?.vehicles[2], expectedVehicles[2])
    XCTAssertEqual(sut?.vehicles[3], expectedVehicles[3])

    XCTAssertEqual(sut?.species.count, 5)
    let expectedSpecies = [
      "https://swapi.co/api/species/5/",
      "https://swapi.co/api/species/3/",
      "https://swapi.co/api/species/2/"
    ]
    XCTAssertEqual(sut?.species[0], expectedSpecies[0])
    XCTAssertEqual(sut?.species[1], expectedSpecies[1])
    XCTAssertEqual(sut?.species[2], expectedSpecies[2])

  }

}
