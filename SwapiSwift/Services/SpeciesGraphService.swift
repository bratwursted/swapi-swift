//
//  SpeciesGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

public final class SpeciesGraphService: GraphService {

  public let species: Species

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published public var films: [Film] = []

  @Published public var people: [Person] = []

  @Published public var homeworld: Planet?

  public init(
    species: Species,
    dataService: SwapiService = DataService()
  ) {
    self.species = species
    self.dataService = dataService
  }

  public func fetchAssociatedProperties() {

    // get homeworld

    dataService.planet(withResourceUrl: species.homeworld)
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
      with: species.films,
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

    // get people

    fetchPeople(
      from: dataService,
      with: species.people,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.people = []
        case .finished:
          break
        }
    }, receiveValue: { people in
      self.people = people
    })
    .store(in: &disposables)
  }
}
