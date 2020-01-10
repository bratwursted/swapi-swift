//
//  MockDataService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A simple mock data service conforming to `SwapiService` initialized with a resource conforming to `SwapiResource`.
/// Designed for use in testing and SwiftUI development.
@available(iOS 13, *)
public struct MockDataService<T: SwapiResource>: SwapiService {

  let mockData: T

  /// Intializes a new instance of `MockDataService` with a specified resource.
  /// - Parameter mockData: The specified resource conforming to `SwapiResource` that will be returned by the mock data service.
  public init(mockData: T) {
    self.mockData = mockData
  }

  public func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> {
    guard let filmData = mockData as? Film else {
      fatalError("Expected mock data to be initialized with type Film")
    }
    return Result.Publisher(filmData).eraseToAnyPublisher()
  }

  public func person(withId resourceId: String) -> AnyPublisher<Person, ServiceError> {
    guard let personData = mockData as? Person else {
      fatalError("Expected mock data to be initialized with type Person")
    }
    return Result.Publisher(personData).eraseToAnyPublisher()
  }

  public func planet(withId resourceId: String) -> AnyPublisher<Planet, ServiceError> {
    guard let planetData = mockData as? Planet else {
      fatalError("Expected mock data to be initialized with type Planet")
    }
    return Result.Publisher(planetData).eraseToAnyPublisher()
  }

  public func planet(withResourceUrl url: String?) -> AnyPublisher<Planet, ServiceError> {
    guard let planetData = mockData as? Planet else {
      fatalError("Expected mock data to be initialized with type Planet")
    }
    return Result.Publisher(planetData).eraseToAnyPublisher()
  }

  public func species(withId resourceId: String) -> AnyPublisher<Species, ServiceError> {
    guard let speciesData = mockData as? Species else {
      fatalError("Expected mock data to be initialized with type Species")
    }
    return Result.Publisher(speciesData).eraseToAnyPublisher()
  }

  public func starship(withId resourceId: String) -> AnyPublisher<Starship, ServiceError> {
    guard let starshipData = mockData as? Starship else {
      fatalError("Expected mock data to be initialized with type Starship")
    }
    return Result.Publisher(starshipData).eraseToAnyPublisher()
  }

  public func vehicle(withId resourceId: String) -> AnyPublisher<Vehicle, ServiceError> {
    guard let vehicleData = mockData as? Vehicle else {
      fatalError("Expected mock data to be initialized with type Vehicle")
    }
    return Result.Publisher(vehicleData).eraseToAnyPublisher()
  }

  public func allFilms(page: String?) -> AnyPublisher<ResourceRoot<Film>, ServiceError> {
    guard let filmsData = mockData as? ResourceRoot<Film> else {
      fatalError("Expected mock data to be initialized with type FilmResourceRoot")
    }
    return Result.Publisher(filmsData).eraseToAnyPublisher()
  }

  public func allPeople(page: String?) -> AnyPublisher<ResourceRoot<Person>, ServiceError> {
    guard let peopleData = mockData as? ResourceRoot<Person> else {
      fatalError("Expected mock data to be initialzed with type PersonResourceRoot")
    }
    return Result.Publisher(peopleData).eraseToAnyPublisher()
  }

  public func allPlanets(page: String?) -> AnyPublisher<ResourceRoot<Planet>, ServiceError> {
        guard let planetsData = mockData as? ResourceRoot<Planet> else {
      fatalError("Expected mock data to be initialzed with type PlanetResourceRoot")
    }
    return Result.Publisher(planetsData).eraseToAnyPublisher()
  }

  public func allSpecies(page: String?) -> AnyPublisher<ResourceRoot<Species>, ServiceError> {
    guard let speciesData = mockData as? ResourceRoot<Species> else {
      fatalError("Expected mock data to be initialzed with type SpeciesResourceRoot")
    }
    return Result.Publisher(speciesData).eraseToAnyPublisher()
  }

  public func allStarships(page: String?) -> AnyPublisher<ResourceRoot<Starship>, ServiceError> {
    guard let starshipsData = mockData as? ResourceRoot<Starship> else {
      fatalError("Expected mock data to be initialzed with type StarshipResourceRoot")
    }
    return Result.Publisher(starshipsData).eraseToAnyPublisher()
  }

  public func allVehicles(page: String?) -> AnyPublisher<ResourceRoot<Vehicle>, ServiceError> {
    guard let vehiclesData = mockData as? ResourceRoot<Vehicle> else {
      fatalError("Expected mock data to be initialzed with type VehicleResourceRoot")
    }
    return Result.Publisher(vehiclesData).eraseToAnyPublisher()
  }

  public func people(fromResourceUrls urls: [String]) -> AnyPublisher<[Person], ServiceError> {
    guard let people = mockData as? [Person] else {
      fatalError("Expected mock data to be initialized with type Person array")
    }
    return Result.Publisher(people).eraseToAnyPublisher()
  }

  public func starships(fromResourceUrls urls: [String]) -> AnyPublisher<[Starship], ServiceError> {
    guard let starships = mockData as? [Starship] else {
      fatalError("Expected mock data to be initialized with type Starship array")
    }
    return Result.Publisher(starships).eraseToAnyPublisher()
  }

  public func planets(fromResourceUrls urls: [String]) -> AnyPublisher<[Planet], ServiceError> {
    guard let planets = mockData as? [Planet] else {
      fatalError("Expected mock data to be initialized with type Planet array")
    }
    return Result.Publisher(planets).eraseToAnyPublisher()
  }

  public func species(fromResourceUrls urls: [String]) -> AnyPublisher<[Species], ServiceError> {
    guard let species = mockData as? [Species] else {
      fatalError("Expected mock data to be initialized with type Species array")
    }
    return Result.Publisher(species).eraseToAnyPublisher()
  }

  public func vehicles(fromResourceUrls urls: [String]) -> AnyPublisher<[Vehicle], ServiceError> {
    guard let vehicles = mockData as? [Vehicle] else {
      fatalError("Expected mock data to be initialized with type Vehicle array")
    }
    return Result.Publisher(vehicles).eraseToAnyPublisher()
  }

  public func films(fromResourceUrls urls: [String]) -> AnyPublisher<[Film], ServiceError> {
    guard let films = mockData as? [Film] else {
      fatalError("Expected mock data to be initialized with type Film array")
    }
    return Result.Publisher(films).eraseToAnyPublisher()
  }
}
