//
//  PersonViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import SwapiSwift

final class PersonViewModel: ObservableObject {

  @ObservedObject private var personService: PersonGraphService

  private var disposables = Set<AnyCancellable>()

  @Published var films: [Film] = []

  @Published var starships: [Starship] = []

  @Published var vehicles: [Vehicle] = []

  @Published var species: [Species] = []

  @Published var homeworld: Planet?

  private var person: Person {
    personService.person
  }

  init(graphService: PersonGraphService) {
    self.personService = graphService
  }

  func fetchProperties() {

    personService.fetchAssociatedProperties()

    personService
      .$films
      .receive(on: DispatchQueue.main)
      .sink { films in
        self.films = films.sorted(by: { (film1, film2) -> Bool in
          film1.episodeId < film2.episodeId
        })
    }
    .store(in: &disposables)

    personService
      .$starships
      .receive(on: DispatchQueue.main)
      .sink { starships in
        self.starships = starships.sorted(by: { (starship1, starship2) -> Bool in
          starship1.name.compare(starship2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    personService
      .$vehicles
      .receive(on: DispatchQueue.main)
      .sink { vehicles in
        self.vehicles = vehicles.sorted(by: { (vehicle1, vehicle2) -> Bool in
          vehicle1.name.compare(vehicle2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    personService
      .$species
      .receive(on: DispatchQueue.main)
      .sink { species in
        self.species = species.sorted(by: { (species1, species2) -> Bool in
          species1.name.compare(species2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    personService
      .$homeworld
      .receive(on: DispatchQueue.main)
      .sink { planet in
        self.homeworld = planet
    }
    .store(in: &disposables)
  }

  var name: String {
    person.name
  }

  var birthYear: String {
    person.birthYear
  }

  var gender: String {
    person.gender.capitalized
  }

  var homePlanet: String? {
    homeworld?.name
  }

  var height: String {
    "\(heightMeters) m"
  }

  var mass: String {
    "\(person.mass) kg"
  }

  var hair: String {
    "\(person.hairColor) hair"
  }

  var eyes: String {
    "\(person.eyeColor) eyes"
  }

  var skin: String {
    "\(person.skinColor) skin"
  }

  func speciesRowView(for species: Species) -> SpeciesRowView {
    let vm = SpeciesRowViewModel(species: species)
    return SpeciesRowView(viewModel: vm)
  }

  func filmRowView(for film: Film) -> FilmRowView {
    let vm = FilmRowViewModel(film: film)
    return FilmRowView(viewModel: vm)
  }

  func starshipRowView(for starship: Starship) -> StarshipRowView {
    let vm = StarshipRowViewModel(starship: starship)
    return StarshipRowView(viewModel: vm)
  }

  func vehicleRowView(for vehicle: Vehicle) -> VehicleRowView {
    let vm = VehicleRowViewModel(vehicle: vehicle)
    return VehicleRowView(viewModel: vm)
  }

  private var heightMeters: String {
    let heightValue = Float(person.height) ?? 0
    return String(heightValue / 100)
  }
}
