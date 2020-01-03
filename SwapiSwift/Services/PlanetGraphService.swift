//
//  PlanetGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

final class PlanetGraphService: GraphService {

  let planet: Planet

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published var residents: [Person] = []

  @Published var films: [Film] = []

  init(
    planet: Planet,
    dataService: SwapiService = DataService()
  ) {
    self.planet = planet
    self.dataService = dataService
  }

  func fetchAssociatedProperties() {
    // get residents

    fetchPeople(
      from: dataService,
      with: planet.residents,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.residents = []
        case .finished:
          break
        }
    }, receiveValue: { people in
      self.residents = people
    })
    .store(in: &disposables)

    // get films

    fetchFilms(
      from: dataService,
      with: planet.films,
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
  }

}