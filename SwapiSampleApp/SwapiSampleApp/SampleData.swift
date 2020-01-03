//
//  SampleData.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

var sampleFilms: ResourceRoot<Film> {
  load("films")
}

var newHopeData: MockGraphDataService.DataStore {
  return [
    .people: newHopeCharacters,
    .planets: newHopePlanets,
    .species: newHopeSpecies,
    .starships: newHopeStarships,
    .vehicles: newHopeVehicles
  ]
}

private var newHopeCharacters: [Person] {
  load("new_hope_characters")
}

private var newHopePlanets: [Planet] {
  load("new_hope_planets")
}

private var newHopeSpecies: [Species] {
  load("new_hope_species")
}

private var newHopeStarships: [Starship] {
  load("new_hope_starships")
}

private var newHopeVehicles: [Vehicle] {
  load("new_hope_vehicles")
}

func load<T: SwapiResource>(_ fileName: String) -> T {
  let data: Data
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .customISO8601

  guard let resource = Bundle.main.url(forResource: fileName, withExtension: "json") else {
    fatalError("Failed to find resource url for \(fileName)")
  }

  do {
    data = try Data(contentsOf: resource)
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("There was a problem parsing the data for \(fileName): \n\(error)")
  }
}
