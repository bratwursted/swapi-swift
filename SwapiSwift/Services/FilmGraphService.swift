//
//  FilmGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/2/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

public final class FilmGraphService: GraphService {

  public let film: Film

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published public var characters: [Person] = []

  @Published public var starships: [Starship] = []

  @Published public var planets: [Planet] = []

  @Published public var species: [Species] = []

  @Published public var vehicles: [Vehicle] = []

  public init(
    film: Film,
    dataService: SwapiService = DataService()) {
    self.film = film
    self.dataService = dataService
  }

  // swiftlint:disable:next function_body_length
  public func fetchAssociatedProperties() {

    // get characters

    fetchPeople(from: dataService, with: film.characters, receiveCompletion: { completion in
      switch completion {
      case .failure(let error):
        self.handleError(error)
        self.characters = []
      case .finished:
        break
      }
    }, receiveValue: { people in
      self.characters = people
    })
      .store(in: &disposables)

    // get starships

    fetchStarships(
      from: dataService,
      with: film.starships,
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

    // get planets

    fetchPlanets(
      from: dataService,
      with: film.planets,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.planets = []
        case .finished:
          break
        }
    }, receiveValue: { planets in
      self.planets = planets
    })
    .store(in: &disposables)

    // get species

    fetchSpecies(
      from: dataService,
      with: film.species,
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

    // get vehicles

    fetchVehicles(
      from: dataService,
      with: film.vehicles,
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
  }
}
