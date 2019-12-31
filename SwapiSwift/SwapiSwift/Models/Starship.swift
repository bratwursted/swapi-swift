//
//  Starship.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a starship featured in the Star Wars universe.
struct Starship: SwapiResource {

  /// An array of Film URL Resources that this starship has appeared in.
  let films: [String]

  /// Timestamp when this resource was created.
  let created: String

  /// The URL for this resource.
  let url: String

  /// The maximum number of kilograms that this starship can transport.
  let cargoCapacity: String

  /// The number of personnel needed to run or pilot this starship.
  let crew: String

  /// An array of People URL Resources that this starship has been piloted by.
  let pilots: [String]

  /// The cost of this starship new, in galactic credits.
  let cost: String

  /// The length of this starship in meters.
  let length: String

  /// The manufacturer of this starship. Comma seperated if more than one.
  let manufacturer: String

  /// The class of this starship's hyperdrive.
  let hyperdriveRating: String

  /// Timestamp when this resource was last edited.
  let edited: String

  /// The model or official name of this starship (e.g., T-65 X-wing or DS-1 Orbital Battle Station).
  let model: String

  /// The number of non-essential people this starship can transport.
  let passengers: String

  /// The maximum length of time that this starship can provide consumables for its entire crew without having to resupply.
  let consumables: String

  /// The common name of this starship (e.g., Death Star).
  let name: String

  /// The maximum speed of this starship in atmosphere. n/a if this starship is incapable of atmosphering flight.
  let maximumAtmosphericSpeed: String

  /// The Maximum number of Megalights this starship can travel in a standard hour. A Megalight is a standard unit of distance and has never been defined before within the Star Wars universe. This figure is only really useful for measuring the difference in speed of starships. We can assume it is similar to AU, the distance between our Sun (Sol) and Earth.
  let maximumMegalights: String

  /// The class of this starship (e.g., Starfighter or Deep Space Mobile Battlestation).
  let starshipClass: String

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
