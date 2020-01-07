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

var samplePeople: ResourceRoot<Person> {
  load("people")
}

var samplePlanets: ResourceRoot<Planet> {
  load("planets")
}

func sampleSpecies(_ name: String) -> Species {
  load(name)
}

func samplePlanet(_ name: String) -> Planet {
  load(name)
}

func sampleStarship(_ name: String) -> Starship {
  load(name)
}

func sampleVehicle(_ name: String) -> Vehicle {
  load(name)
}

var snowspeederData: MockGraphDataService.DataStore {
  let films: [Film] = load("snowspeeder_films")
  let pilots: [Person] = load("snowspeeder_pilots")
  return [
    .films: films,
    .people: pilots
  ]
}

var falconData: MockGraphDataService.DataStore {
  let films: [Film] = load("falcon_films")
  let pilots: [Person] = load("falcon_pilots")
  return [
    .films: films,
    .people: pilots
  ]
}

var huttData: MockGraphDataService.DataStore {
  let films: [Film] = load("hutt_films")
  let people: [Person] = load("hutt_people")
  return [
    .films: films,
    .people: people
  ]
}

var lukeData: MockGraphDataService.DataStore {
  let films: [Film] = load("luke_films")
  let species: [Species] = load("luke_species")
  let starships: [Starship] = load("luke_starships")
  let vehicles: [Vehicle] = load("luke_vehicles")
  return [
    .films: films,
    .species: species,
    .starships: starships,
    .vehicles: vehicles
  ]
}

var alderaanData: MockGraphDataService.DataStore {
  let films: [Film] = load("alderaan_films")
  let residents: [Person] = load("alderaan_residents")
  return [
    .films: films,
    .people: residents
  ]
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
