//
//  Starship.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a starship featured in the Star Wars universe.
public struct Starship: SwapiResource, Hashable {

  /// An array of `Film` resource URLs that this starship has appeared in.
  public let films: [String]

  /// Timestamp when this resource was created.
  public let created: Date

  /// The URL for this resource.
  public let url: String

  /// The maximum mass of cargo this starship can transport, in kilograms.
  public let cargoCapacity: String

  /// The number of personnel needed to run or pilot this starship.
  public let crew: String

  /// An array of `Person` resource URLs that this starship has been piloted by.
  public let pilots: [String]

  /// The cost of this starship new, in galactic credits.
  public let cost: String

  /// The length of this starship, in meters.
  public let length: String

  /// The manufacturer of this starship. Comma seperated if more than one (e.g., "Kuat Drive Yards, Fondor Shipyards").
  public let manufacturer: String

  /// The class of this starship's hyperdrive.
  public let hyperdriveRating: String

  /// Timestamp of the last edit for this resource.
  public let edited: Date

  /// The model or official name of this starship (e.g., "T-65 X-wing" or "DS-1 Orbital Battle Station").
  public let model: String

  /// The number of non-essential people this starship can transport.
  public let passengers: String

  /// The maximum length of time that this starship can provide consumables for its entire crew without having to resupply.
  public let consumables: String

  /// The common name of this starship (e.g., "Death Star").
  public let name: String

  /// The maximum speed of this starship in atmosphere, in kph. "n/a" if this starship is incapable of atmosphering flight.
  public let maximumAtmosphericSpeed: String

  /// The Maximum number of Megalights this starship can travel in a standard hour. A Megalight is a standard unit of distance and has never been defined before within the Star Wars universe. This figure is only really useful for measuring the difference in speed of starships. We can assume it is similar to AU, the distance between our Sun (Sol) and Earth.
  public let maximumMegalights: String

  /// The class of this starship (e.g., "Starfighter" or "Deep Space Mobile Battlestation").
  public let starshipClass: String

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
    case hyperdriveRating = "hyperdrive_rating"
    case edited
    case model
    case passengers
    case consumables
    case name
    case maximumAtmosphericSpeed = "max_atmosphering_speed"
    case maximumMegalights = "MGLT"
    case starshipClass = "starship_class"
  }
}

extension Starship {
  static let mockResourceUrl = "https://swapi.co/api/starships/mock"

  static var mock: Starship {
    Starship(
      films: [Film.mockResourceUrl],
      created: Date(),
      url: mockResourceUrl,
      cargoCapacity: "Mock Cargo Capacity",
      crew: "Mock Crew Size",
      pilots: [Person.mockResourceUrl],
      cost: "Mock Starship Cost",
      length: "Mock Starship Length",
      manufacturer: "Mock Starship Manufacturer",
      hyperdriveRating: "Mock Hyperdrive Rating",
      edited: Date(),
      model: "Mock Starship Model",
      passengers: "Mock Starship Passenger Capacity",
      consumables: "Mock Starship Consumables",
      name: "Mock Starship Name",
      maximumAtmosphericSpeed: "Mock Maximum Speed",
      maximumMegalights: "Mock Maximum Megalights",
      starshipClass: "Mock Starship Class"
    )
  }
}
