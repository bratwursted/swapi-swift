//
//  Starship.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

struct Starship: Codable {
  let films: [Film]

  let created: String

  let url: String

  let cargoCapacity: String

  let crew: String

  let pilots: [Person]

  let cost: String

  let length: String

  let manufacturer: String

  let hyperdriveRating: String

  let edited: String

  let model: String

  let passengers: String

  let consumables: String

  let name: String

  let maximumAtmosphericSpeed: String

  let maximumMegalights: String

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
