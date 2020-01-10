//
//  PlanetGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A helper class responsible for handling requests for resources associated with a `Planet`
@available(iOS 13, *)
public final class PlanetGraphService: GraphService {

  public let planet: Planet

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published public var residents: [Person] = []

  @Published public var films: [Film] = []

  /// Instantiates a new instance of `PlanetGraphService`
  /// - Parameters:
  ///   - planet: The specified `Planet`
  ///   - dataService: A data service conforming to `SwapiService`. Defaults to `DataService` if not specified. 
  public init(
    planet: Planet,
    dataService: SwapiService = DataService()
  ) {
    self.planet = planet
    self.dataService = dataService
  }

  public func fetchAssociatedProperties() {
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
