//
//  Vehicle.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a vehicle in the Star Wars universe.
public struct Vehicle: SwapiResource, Hashable {

  /// An array of `Film` resource URLs that this vehicle has appeared in.
  public let films: [String]

  /// Timestamp when this resource was created.
  public let created: Date

  /// The URL of this resource.
  public let url: String

  /// The maximum mass of cargo this vehicle can transport, in kilograms.
  public let cargoCapacity: String

  /// The number of personnel needed to run or pilot this vehicle.
  public let crew: String

  /// An array of `People` resource URLs that this vehicle has been piloted by.
  public let pilots: [String]

  /// The cost of this vehicle new, in galactic credits.
  public let cost: String

  /// The length of this vehicle, in meters.
  public let length: String

  /// The manufacturer of this vehicle. Comma seperated if more than one (e.g., "Corellia Mining Corporation").
  public let manufacturer: String

  /// Timestamp of the last edit for this resource.
  public let edited: Date

  /// The model or official name of this vehicle (e.g.,  "All Terrain Attack Transport").
  public let model: String

  /// The number of non-essential people this vehicle can transport.
  public let passengers: String

  /// The class of this vehicle (e.g., "wheeled").
  public let vehicleClass: String

  /// The maximum length of time that this vehicle can provide consumables for its entire crew without having to resupply.
  public let consumables: String

  /// The common name of this vehicle (e.g., "Sand Crawler").
  public let name: String

  /// The maximum speed of this vehicle in atmosphere. in kph.
  public let maximumAtmosphericSpeed: String

  enum CodingKeys: String, CodingKey {
    case films
    case created
    case url
    case cargoCapacity = "cargo_capacity"
    case crew
    case pilots
    case cost = "cost_in_credits"
    case length
    case manufacturer
    case edited
    case model
    case passengers
    case vehicleClass = "vehicle_class"
    case consumables
    case name
    case maximumAtmosphericSpeed = "max_atmosphering_speed"
  }
}

extension Vehicle {
  static let mockResourceUrl = "https://swapi.co/api/vehicles/mock"

  static var mock: Vehicle {
    Vehicle(
      films: [Film.mockResourceUrl],
      created: Date(),
      url: mockResourceUrl,
      cargoCapacity: "Mock Vehicle Cargo Capacity",
      crew: "Mock Vehicle Crew Size",
      pilots: [Person.mockResourceUrl],
      cost: "Mock Vehicle Cost",
      length: "Mock Vehicle Length",
      manufacturer: "Mock Vehicle Manufacturer",
      edited: Date(),
      model: "Mock Vehicle Model",
      passengers: "Mock Vehicle Passenger Capacity",
      vehicleClass: "Mock Vehicle Class",
      consumables: "Mock Vehicle Consumables",
      name: "Mock Vehicle Name",
      maximumAtmosphericSpeed: "Mock Vehicle Maximum Speed"
    )
  }
}
