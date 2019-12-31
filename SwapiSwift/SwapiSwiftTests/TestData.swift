//
//  TestData.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation
@testable import SwapiSwift

extension Formatter {
  static let iso8601: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return formatter
  }()
  static let iso8601NoFs = ISO8601DateFormatter()
}

extension JSONDecoder.DateDecodingStrategy {
  static let customISO8601 = custom {
    let container = try $0.singleValueContainer()
    let string = try container.decode(String.self)
    if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601NoFs.date(from: string) {
      return date
    }
    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format \(string)")
  }
}

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
  let bundle = Bundle(identifier: "com.thinx.SwapiSwiftTests")
  guard let dataFile = bundle?.url(forResource: testFile, withExtension: "json") else {
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
