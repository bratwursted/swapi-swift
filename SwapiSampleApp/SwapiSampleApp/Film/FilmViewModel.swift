//
//  FilmViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine
import SwiftUI

final class FilmViewModel: ObservableObject {

  private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()

  private let outputFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  private var disposables = Set<AnyCancellable>()

  @ObservedObject private var filmService: FilmGraphService

  private var film: Film {
    filmService.film
  }

  @Published var characters: [Person] = []

  @Published var planets: [Planet] = []

  @Published var species: [Species] = []

  @Published var starships: [Starship] = []

  @Published var vehicles: [Vehicle] = []

  var needsAssociatedProperties = true

  init(
    filmService: FilmGraphService
  ) {
    self.filmService = filmService
  }

  func fetchFilmProperties() {
    filmService.fetchAssociatedProperties()
    needsAssociatedProperties = false

    filmService
      .$characters
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { people in
        self.characters = people.sorted(by: { (person1, person2) -> Bool in
          person1.name.compare(person2.name, options: .caseInsensitive) == .orderedAscending
        })
      })
    .store(in: &disposables)

    filmService
    .$planets
      .receive(on: DispatchQueue.main)
      .sink { planets in
        self.planets = planets.sorted(by: { (planet1, planet2) -> Bool in
          planet1.name.compare(planet2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    filmService
    .$species
      .receive(on: DispatchQueue.main)
      .sink { species in
        self.species = species.sorted(by: { (species1, species2) -> Bool in
          species1.name.compare(species2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    filmService
    .$starships
      .receive(on: DispatchQueue.main)
      .sink { starships in
        self.starships = starships.sorted(by: { (starship1, starship2) -> Bool in
          starship1.name.compare(starship2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    filmService
    .$vehicles
      .receive(on: DispatchQueue.main)
      .sink { vehicles in
        self.vehicles = vehicles.sorted(by: { (vehicle1, vehicle2) -> Bool in
          vehicle1.name.compare(vehicle2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)
  }

  var episideTitle: String {
    film.title
  }

  var filmTitle: String {
    "Episode \(episode)"
  }

  var formattedReleaseDate: String {
    outputFormatter.string(from: releaseDate)
  }

  var director: String {
    film.director
  }

  var producers: String {
    film.producer
  }

  var crawlSnipet: String {
    film.cleanCrawlString.firstSentence ?? "n/a"
  }

  func filmInfoView() -> FilmInfoView {
    let vm = FilmInfoViewModel(film: film)
    return FilmInfoView(viewModel: vm)
  }

  func characterRowView(forIndex index: Int) -> CharacterRowView {
    let character = characters[index]
    let vm = CharacterRowViewModel(character: character)
    return CharacterRowView(viewModel: vm)
  }

  func planetRowView(forIndex index: Int) -> PlanetRowView {
    let planet = planets[index]
    let vm = PlanetRowViewModel(planet: planet)
    return PlanetRowView(viewModel: vm)
  }

  func speciesRowView(forIndex index: Int) -> SpeciesRowView {
    let vm = SpeciesRowViewModel(species: species[index])
    return SpeciesRowView(viewModel: vm)
  }

  func starshipRowView(forIndex index: Int) -> StarshipRowView {
    let vm = StarshipRowViewModel(starship: starships[index])
    return StarshipRowView(viewModel: vm)
  }

  func vehicleRowView(forIndex index: Int) -> VehicleRowView {
    let vm = VehicleRowViewModel(vehicle: vehicles[index])
    return VehicleRowView(viewModel: vm)
  }

  var characterList: CharacterList {
    CharacterList(viewModel: CharacterListViewModel(characters: characters))
  }

  var planetList: PlanetList {
    PlanetList(viewModel: PlanetListViewModel(planets: planets))
  }

  var speciesList: SpeciesList {
    SpeciesList(viewModel: SpeciesListViewModel(species: species))
  }

  var starshipList: StarshipList {
    StarshipList(viewModel: StarshipListViewModel(starships: starships))
  }

  private var releaseDate: Date {
    formatter.date(from: film.releaseDate)!
  }

  private var episode: String {
    String(film.episodeId)
  }
}

private extension String {

  var firstSentence: String? {
    sentences.first
  }

  var sentences: [String] {
    let range = self.startIndex..<self.endIndex
    var sentences: [String] = []
    self.enumerateSubstrings(in: range, options: .bySentences) { (substring, range, enclosingRange, stopPointer) in
      if let sentence = substring {
        sentences.append(sentence.trimmingCharacters(in: .whitespacesAndNewlines))
      }
    }
    return sentences
  }
}
