//
//  TestData.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation
@testable import SwapiSwift

final class TestData { }

var sampleFilm: Film {
  load("film_response")
}

var samplePerson: Person {
  load("person_response")
}

var samplePlanet: Planet {
  load("planet_response")
}

var sampleSpecies: Species {
  load("species_response")
}

var sampleStarship: Starship {
  load("starship_response")
}

var sampleVehicle: Vehicle {
  load("vehicle_response")
}

var sampleFilms: ResourceRoot<Film> {
  load("films")
}

var sampleRoot: SwapiRoot {
  load("root")
}

func load<T: Decodable>(_ testFile: String) -> T {
  let bundle = Bundle(for: TestData.self)
  guard let dataFile = bundle.url(forResource: testFile, withExtension: "json") else {
    fatalError("Failed to load test data \(testFile)")
  }
  do {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .customISO8601
    let data = try Data(contentsOf: dataFile)
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Failed to parse the sample data \(error.localizedDescription)")
  }
}
