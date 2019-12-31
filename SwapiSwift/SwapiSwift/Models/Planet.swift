//
//  Planet.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

struct Planet: Codable {
  let terrain: String

  let population: String

  let diameter: String

  let url: String

  let residents: [Person]

  let climate: String

  let orbitalPeriod: String

  let edited: String

  let films: [Film]

  let surfaceWater: String

  let gravity: String

  let created: String

  let rotationPeriod: String

  let name: String

  enum CodingKeys: String, CodingKey {
    case terrain
    case population
    case diameter
    case url
    case residents
    case climate
    case orbitalPeriod = "orbital_period"
    case edited
    case films
    case surfaceWater = "surface_water"
    case gravity
    case created
    case rotationPeriod = "rotation_period"
    case name
  }
}
