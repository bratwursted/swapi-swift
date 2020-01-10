//
//  MockGraphDataService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A mock data service confomring to `SwapiService` for use in testing and SwiftUI development.
/// This mock data service is designed for use with `GraphService` helper classes
public struct MockGraphDataService: SwapiService {

  /// A key-value store containing arrays of resources conforming to `SwapiResource`.
  public typealias DataStore = [DataStoreKey: [SwapiResource]]

  /// An enumeration of keys used to store and access resources from a `DataStore`.
  public enum DataStoreKey {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
  }

  private let dataStore: DataStore

  private let homeworld: Planet?

  /// Initializes a new instance of `MockGraphDataService`.
  /// - Parameters:
  ///   - dataStore: A specified `DataStore` used by the mock data service for returning values.
  ///   - homeworld: An optional `Planet` resource that can be accessed through the mock data service.
  public init(
    dataStore: DataStore,
    homeworld: Planet? = nil
  ) {
    self.dataStore = dataStore
    self.homeworld = homeworld
  }

  public func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func person(withId resourceId: String) -> AnyPublisher<Person, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func planet(withId resourceId: String) -> AnyPublisher<Planet, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func planet(withResourceUrl url: String?) -> AnyPublisher<Planet, ServiceError> {
    guard let planet = homeworld else {
      fatalError("Expected type Planet")
    }
    return Result.Publisher(planet).eraseToAnyPublisher()
  }

  public func species(withId resourceId: String) -> AnyPublisher<Species, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func starship(withId resourceId: String) -> AnyPublisher<Starship, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func vehicle(withId resourceId: String) -> AnyPublisher<Vehicle, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allFilms(page: String?) -> AnyPublisher<ResourceRoot<Film>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allPeople(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Planet>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allSpecies(page: String?) -> AnyPublisher<ResourceRoot<Species>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allStarships(page: String?) -> AnyPublisher<ResourceRoot<Starship>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func allVehicles(page: String?) -> AnyPublisher<ResourceRoot<Vehicle>, ServiceError> {
    fatalError("Method not implemented for MockGraphDataService")
  }

  public func people(fromResourceUrls urls: [String]) -> AnyPublisher<[Person], ServiceError> {
    guard let people = dataStore[.people] as? [Person] else {
      fatalError("Expected mock data to be initialized with type Person array.")
    }
    return Result.Publisher(people).eraseToAnyPublisher()
  }

  public func starships(fromResourceUrls urls: [String]) -> AnyPublisher<[Starship], ServiceError> {
    guard let starships = dataStore[.starships] as? [Starship] else {
      fatalError("Expected mock data to be initialized with type Starship array")
    }
    return Result.Publisher(starships).eraseToAnyPublisher()
  }

  public func planets(fromResourceUrls urls: [String]) -> AnyPublisher<[Planet], ServiceError> {
    guard let planets = dataStore[.planets] as? [Planet] else {
      fatalError("Expected mock data to be initialized with type Planet array")
    }
    return Result.Publisher(planets).eraseToAnyPublisher()
  }

  public func species(fromResourceUrls urls: [String]) -> AnyPublisher<[Species], ServiceError> {
    guard let species = dataStore[.species] as? [Species] else {
      fatalError("Expected mock data to be initialized with type Species array")
    }
    return Result.Publisher(species).eraseToAnyPublisher()
  }

  public func vehicles(fromResourceUrls urls: [String]) -> AnyPublisher<[Vehicle], ServiceError> {
    guard let vehicles = dataStore[.vehicles] as? [Vehicle] else {
      fatalError("Expected mock data to be initialized withy type Vehicle array")
    }
    return Result.Publisher(vehicles).eraseToAnyPublisher()
  }

  public func films(fromResourceUrls urls: [String]) -> AnyPublisher<[Film], ServiceError> {
    guard let films = dataStore[.films] as? [Film] else {
      fatalError("Expected mock data to be initialized with type Film  array")
    }
    return Result.Publisher(films).eraseToAnyPublisher()
  }
}
