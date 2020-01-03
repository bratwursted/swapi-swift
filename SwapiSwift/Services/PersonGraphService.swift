//
//  PersonGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

final class PersonGraphService: GraphService {

  let person: Person

  // Associated properties

  @Published var films: [Film] = []

  @Published var starships: [Starship] = []

  @Published var vehicles: [Vehicle] = []

  @Published var species: [Species] = []

  @Published var homeworld: Planet?

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  init(
    person: Person,
    dataService: SwapiService = DataService()) {
    self.person = person
    self.dataService = dataService
  }

  // swiftlint:disable:next function_body_length
  func fetchAssociatedProperties() {
    // get homeworld

    dataService.planet(withResourceUrl: person.homeworld)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.homeworld = nil
        case .finished:
          break
        }
      }, receiveValue: { planet in
        self.homeworld = planet
      })
    .store(in: &disposables)

    // get films

    fetchFilms(
      from: dataService,
      with: person.films,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.films = []
        case .finished:
          break
        }
    }, receiveValue: { films in
      self.films = films
    })
    .store(in: &disposables)

    // get starships

    fetchStarships(
      from: dataService,
      with: person.starships,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.starships = []
        case .finished:
          break
        }
    }, receiveValue: { starships in
      self.starships = starships
    })
    .store(in: &disposables)

    // get vehicles

    fetchVehicles(
      from: dataService,
      with: person.vehicles,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.vehicles = []
        case .finished:
          break
        }
    }, receiveValue: { vehicles in
      self.vehicles = vehicles
    })
    .store(in: &disposables)

    // get species

    fetchSpecies(
      from: dataService,
      with: person.species,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.species = []
        case .finished:
          break
        }
    }, receiveValue: { species in
      self.species = species
    })
    .store(in: &disposables)
  }
}
