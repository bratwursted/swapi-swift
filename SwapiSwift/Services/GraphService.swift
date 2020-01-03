//
//  GraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/2/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

protocol GraphService {

  func fetchAssociatedProperties()

}

/// A free function for getting multiple `Person` resources from an array of resource URLs.
/// - Parameter dataService: A data service, conforming to `SwapiService`.
/// - Parameter urls: The specified array of `String` URLs.
/// - Parameter receiveCompletion: A closure executed upon completion of the request.
/// - Parameter receiveValue: A closure executed upon receipt of the value, takes an array of `Person` as it's argument.
/// - Returns: A cancellable instance.
func fetchPeople(
  from dataService: SwapiService,
  with urls: [String],
  receiveCompletion: @escaping ((Subscribers.Completion<ServiceError>) -> Void),
  receiveValue: @escaping (([Person]) -> Void)
) -> AnyCancellable {
  return dataService.people(fromResourceUrls: urls)
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
}

/// A free function for getting multiple `Planet` resources from an array of resource URLs and a specified data service.
/// - Parameters:
///   - dataService: The specified data service, conforming to `SwapiService`.
///   - urls: The specified array of `String` resource URLs.
///   - receiveCompletion: A closure executed upon completion of the requests.
///   - receiveValue: A closure executed upon receipt of a value, takes an array of `Planet` as its argument.
func fetchPlanets(
  from dataService: SwapiService,
  with urls: [String],
  receiveCompletion: @escaping ((Subscribers.Completion<ServiceError>) -> Void),
  receiveValue: @escaping (([Planet]) -> Void)
  ) -> AnyCancellable {
  return dataService.planets(fromResourceUrls: urls)
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
}

/// A free function for requesting an array of `Species` resources from a data service with an array of resource URLs.
/// - Parameters:
///   - dataService: The specified data service, conforming to `SwapiService`.
///   - urls: The specified array of `String` resource URLs.
///   - receiveCompletion: A closure executed upon completion ofg of the network request.
///   - receiveValue: A closure executed upon receipt of a value, takes an array of `Species` as its argument. 
func fetchSpecies(
  from dataService: SwapiService,
  with urls: [String],
  receiveCompletion: @escaping ((Subscribers.Completion<ServiceError>) -> Void),
  receiveValue: @escaping (([Species]) -> Void)
  ) -> AnyCancellable {
  return dataService.species(fromResourceUrls: urls)
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
}

/// A free function for requesting an array of `Starship` resources from a data service with an array of resource URLs.
/// - Parameters:
///   - dataService: The specified data service, conforming to `SwapiService`
///   - urls: The specified arrays of `String` resource URLs.
///   - receiveCompletion: A closure executed upon completion of the request.
///   - receiveValue: A closure executed upon receipt of a value, takes an array of `Starship` as its argument.
func fetchStarships(
  from dataService: SwapiService,
  with urls: [String],
  receiveCompletion: @escaping ((Subscribers.Completion<ServiceError>) -> Void),
  receiveValue: @escaping (([Starship]) -> Void)
  ) -> AnyCancellable {
  return dataService.starships(fromResourceUrls: urls)
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
}

/// A free function for requesting an array of `Vehicle` resources from a data service with an array of resource URLs.
/// - Parameters:
///   - dataService: The specified data service, conforming to `SwapiService`
///   - urls: The specified array of `String` resource URLs.
///   - receiveCompletion: A closure executed upon completion of the request.
///   - receiveValue: A closure executed upon receipt of a value, takes an array of `Vehicle` as its argument.
func fetchVehicles(
  from dataService: SwapiService,
  with urls: [String],
  receiveCompletion: @escaping ((Subscribers.Completion<ServiceError>) -> Void),
  receiveValue: @escaping (([Vehicle]) -> Void)
  ) -> AnyCancellable {
  return dataService.vehicles(fromResourceUrls: urls)
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: receiveCompletion, receiveValue: receiveValue)
}
