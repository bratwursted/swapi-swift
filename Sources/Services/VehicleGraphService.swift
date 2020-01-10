//
//  VehicleGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A helper class responsible for handling requests for resources associated with a `Vehicle`.
@available(iOS 13, *)
public final class VehicleGraphService: GraphService {

  public let vehicle: Vehicle

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published public var films: [Film] = []

  @Published public var pilots: [Person] = []

  /// Instantiates a new instance of `VehicleGraphService`
  /// - Parameters:
  ///   - vehicle: The specified `Vehicle`
  ///   - dataService: A data service confirming to `SwapiService`. Defaults to `DataService` if not specified.
  public init(
    vehicle: Vehicle,
    dataService: SwapiService = DataService()
  ) {
    self.vehicle = vehicle
    self.dataService = dataService
  }

  public func fetchAssociatedProperties() {

    // get films

    fetchFilms(
      from: dataService,
      with: vehicle.films,
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
      with: vehicle.pilots,
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
