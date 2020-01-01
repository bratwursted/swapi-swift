//
//  Vehicle.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a vehicle in the Star Wars universe.
struct Vehicle: SwapiResource {

  /// An array of Film URL Resources that this vehicle has appeared in.
  let films: [String]

  /// Timestamp when this resource was created.
  let created: Date

  /// The hypermedia URL of this resource.
  let url: String

  /// The maximum number of kilograms that this vehicle can transport.
  let cargoCapacity: String

  /// The number of personnel needed to run or pilot this vehicle.
  let crew: String

  /// An array of People URL Resources that this vehicle has been piloted by.
  let pilots: [String]

  /// The cost of this vehicle new, in galactic credits.
  let cost: String

  /// The length of this vehicle in meters.
  let length: String

  /// The manufacturer of this vehicle. Comma seperated if more than one.
  let manufacturer: String

  /// Timestamp when this resource was last edited.
  let edited: Date

  /// The model or official name of this vehicle (e.g.,  All Terrain Attack Transport).
  let model: String

  /// The number of non-essential people this vehicle can transport.
  let passengers: String

  /// The class of this vehicle (e.g., Wheeled).
  let vehicleClass: String

  /// The maximum length of time that this vehicle can provide consumables for its entire crew without having to resupply.
  let consumables: String

  /// The common name of this vehicle (e.g., Sand Crawler).
  let name: String

  /// The maximum speed of this vehicle in atmosphere.
  let maximumAtmosphericSpeed: String

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
