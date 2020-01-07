//
//  StarshipGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A helper class responsible for handling requests for resources associated with a `Starship`.
public final class StarshipGraphService: GraphService {

  public let starship: Starship

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published public var films: [Film] = []

  @Published public var pilots: [Person] = []

  /// Instantiates a new instance of `StarshipGraphService`
  /// - Parameters:
  ///   - starship: The specified `Starship`
  ///   - dataService: A data service conforming to `SwapiService`. Defaults to `DataService` if not specified. 
  public init(
    starship: Starship,
    dataService: SwapiService = DataService()
  ) {
    self.starship = starship
    self.dataService = dataService
  }

  public func fetchAssociatedProperties() {

    // get films

    fetchFilms(
      from: dataService,
      with: starship.films,
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

    // get pilots

    fetchPeople(
      from: dataService,
      with: starship.pilots,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.pilots = []
        case .finished:
          break
        }
    }, receiveValue: { people in
      self.pilots = people
    })
    .store(in: &disposables)
  }
}
