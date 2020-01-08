//
//  SwapiService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// An enumeration of error states that can be returned from a `SwapiService`
public enum ServiceError: Error {
  case unknown
  case networkError(error: NetworkError)
  case parsingError(error: Error)
}

/// Objects conforming to the `SwapiService` protocol may act as a data service for request resources from the Star Wars API (SWAPI)
public protocol SwapiService {

  /// Call this function to request a `Film` resource with a resource ID
  /// - Parameter resourceId: The specified  ID `String` for the `Film` being requested.
  func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError>

  /// Call this function to request a `Person` resource with a resource ID.
  /// - Parameter resourceId: The specified ID `String` for the `Person` being requested.
  func person(withId resourceId: String) -> AnyPublisher<Person, ServiceError>

  /// Call this function to request a `Planet` resource with a resource ID.
  /// - Parameter resourceId: The specified ID `String` for the resource.
  func planet(withId resourceId: String) -> AnyPublisher<Planet, ServiceError>

  /// Call tis function to request a `Planet` resource with a resource URL.
  /// - Parameter url: The specified URL `String` for the resource.
  func planet(withResourceUrl url: String?) -> AnyPublisher<Planet, ServiceError>

  /// Call tis function to request a `Species` resource with a resource ID.
  /// - Parameter resourceId: The specified ID `String` for the resource.
  func species(withId resourceId: String) -> AnyPublisher<Species, ServiceError>

  /// Call this function to request a `Starship` resource with a resource ID.
  /// - Parameter resourceId: The specified  ID `String` for the resource.
  func starship(withId resourceId: String) -> AnyPublisher<Starship, ServiceError>

  /// Call this function to request a `Vehicle` resource with a resource ID.
  /// - Parameter resourceId: The specified ID `String` for the resource.
  func vehicle(withId resourceId: String) -> AnyPublisher<Vehicle, ServiceError>

  /// Call this function to request a list of all the `Film` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allFilms(page: String?) -> AnyPublisher<ResourceRoot<Film>, ServiceError>

  /// Call this function to request a list of all the `Person` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allPeople(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError>

  /// Call this function to request a list of all the `Planet` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Planet>, ServiceError>

  /// Call this function to request a list of all the `Species` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allSpecies(page: String?) -> AnyPublisher<ResourceRoot<Species>, ServiceError>

  /// Call this function to request a list of all the `Starship` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allStarships(page: String?) -> AnyPublisher<ResourceRoot<Starship>, ServiceError>

  /// Call this function to request a list of all the `Vehicle` resources available from the API service.
  /// - Parameter page: An optional resource URL `String` specifying the page of results being requested.
  func allVehicles(page: String?) -> AnyPublisher<ResourceRoot<Vehicle>, ServiceError>

  /// Call this function to perform multiple requests for `Film` resources using an array of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func films(fromResourceUrls urls: [String]) -> AnyPublisher<[Film], ServiceError>

  /// Call this function to perform multiple requests for `Person` resources using an array of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func people(fromResourceUrls urls: [String]) -> AnyPublisher<[Person], ServiceError>

  /// Call this function to perform multiple requests for `Planet` resources from an using of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func planets(fromResourceUrls urls: [String]) -> AnyPublisher<[Planet], ServiceError>

  /// Call this function to perform multiple requests for `Species` resources using an array of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func species(fromResourceUrls urls: [String]) -> AnyPublisher<[Species], ServiceError>

  /// Call this function to perform multiple requests for `Starship` resources using an array of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func starships(fromResourceUrls urls: [String]) -> AnyPublisher<[Starship], ServiceError>

  /// Call this function to perform multiple requests for `Vehicle` resources using an array of resource URLs.
  /// - Parameter urls: The specified array of resource URLs for the resources being requested.
  func vehicles(fromResourceUrls urls: [String]) -> AnyPublisher<[Vehicle], ServiceError>

}

/// The default implementation of a data service conforming to the `SwapiService` protocol.
public struct DataService: SwapiService {

  private let dataFetcher = DataFetcher()

  public init() { }

  public func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> {
    let config = RequestConfiguration(resource: .films)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func person(withId resourceId: String) -> AnyPublisher<Person, ServiceError> {
    let config = RequestConfiguration(resource: .people)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func planet(withId resourceId: String) -> AnyPublisher<Planet, ServiceError> {
    let config = RequestConfiguration(resource: .planets)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func planet(withResourceUrl url: String?) -> AnyPublisher<Planet, ServiceError> {
    return resource(request: Request(resourceUrl: url))
  }

  public func species(withId resourceId: String) -> AnyPublisher<Species, ServiceError> {
    let config = RequestConfiguration(resource: .species)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func starship(withId resourceId: String) -> AnyPublisher<Starship, ServiceError> {
    let config = RequestConfiguration(resource: .starships)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func vehicle(withId resourceId: String) -> AnyPublisher<Vehicle, ServiceError> {
    let config = RequestConfiguration(resource: .vehicles)
    return resource(request: Request(config: config, resourceId: resourceId))
  }

  public func allFilms(page: String?) -> AnyPublisher<ResourceRoot<Film>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .films)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func allPeople(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .people)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Planet>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .planets)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func allSpecies(page: String?) -> AnyPublisher<ResourceRoot<Species>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .species)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func allStarships(page: String?) -> AnyPublisher<ResourceRoot<Starship>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .starships)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func allVehicles(page: String?) -> AnyPublisher<ResourceRoot<Vehicle>, ServiceError> {
    guard let pageUrl = page else {
      let config = RequestConfiguration(resource: .vehicles)
      return resource(request: Request(config: config))
    }
    return resource(request: Request(resourceUrl: pageUrl))
  }

  public func people(fromResourceUrls urls: [String]) -> AnyPublisher<[Person], ServiceError> {
    let requests = urls.map { Request(resourceUrl: $0) }
    return resources(requests: requests)
  }

  public func starships(fromResourceUrls urls: [String]) -> AnyPublisher<[Starship], ServiceError> {
    return resources(requests: urls.map { Request(resourceUrl: $0) })
  }

  public func planets(fromResourceUrls urls: [String]) -> AnyPublisher<[Planet], ServiceError> {
    return resources(requests: urls.map { Request(resourceUrl: $0) })
  }

  public func species(fromResourceUrls urls: [String]) -> AnyPublisher<[Species], ServiceError> {
    return resources(requests: urls.map { Request(resourceUrl: $0) })
  }

  public func vehicles(fromResourceUrls urls: [String]) -> AnyPublisher<[Vehicle], ServiceError> {
    return resources(requests: urls.map { Request(resourceUrl: $0) })
  }

  public func films(fromResourceUrls urls: [String]) -> AnyPublisher<[Film], ServiceError> {
    return resources(requests: urls.map { Request(resourceUrl: $0) })
  }

  private func resources<T: SwapiResource>(requests: [Request]) -> AnyPublisher<[T], ServiceError> {
    let masterPublisher = Publishers.Sequence<[AnyPublisher<T, ServiceError>], ServiceError>(
      sequence: requests.map(resource(request:))
    )
    return masterPublisher.flatMap { $0 }.collect().eraseToAnyPublisher()
  }

  private func resource<T: SwapiResource>(request: Request) -> AnyPublisher<T, ServiceError> {
    return dataFetcher.fetch(request.url)
      .mapError { error in
        ServiceError.networkError(error: error)
    }
    .flatMap(maxPublishers: .max(1)) { data in
      decode(data)
    }
    .eraseToAnyPublisher()
  }
}
