//
//  SwapiService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

public enum ServiceError: Error {
  case unknown
  case networkError(error: NetworkError)
  case parsingError(error: Error)
}

public protocol SwapiService {

  func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError>

  func person(withId resourceId: String) -> AnyPublisher<Person, ServiceError>

  func planet(withId resourceId: String) -> AnyPublisher<Planet, ServiceError>

  func species(withId resourceId: String) -> AnyPublisher<Species, ServiceError>

  func starship(withId resourceId: String) -> AnyPublisher<Starship, ServiceError>

  func vehicle(withId resourceId: String) -> AnyPublisher<Vehicle, ServiceError>

  func allFilms(page: String?) -> AnyPublisher<ResourceRoot<Film>, ServiceError>

  func allPeople(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError>

  func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError>

  func allSpecies(page: String?) -> AnyPublisher<ResourceRoot<Species>, ServiceError>

  func allStarships(page: String?) -> AnyPublisher<ResourceRoot<Starship>, ServiceError>

  func allVehicles(page: String?) -> AnyPublisher<ResourceRoot<Vehicle>, ServiceError>

  func people(fromResourceUrls urls: [String]) -> AnyPublisher<[Person], ServiceError>

  func starships(fromResourceUrls urls: [String]) -> AnyPublisher<[Starship], ServiceError>

  func planets(fromResourceUrls urls: [String]) -> AnyPublisher<[Planet], ServiceError>

  func species(fromResourceUrls urls: [String]) -> AnyPublisher<[Species], ServiceError>

  func vehicles(fromResourceUrls urls: [String]) -> AnyPublisher<[Vehicle], ServiceError>

  func films(fromResourceUrls urls: [String]) -> AnyPublisher<[Film], ServiceError>

}

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

  public func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError> {
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
