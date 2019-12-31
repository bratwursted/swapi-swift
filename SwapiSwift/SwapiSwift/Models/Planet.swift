//
//  Planet.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a planet in the Star Wars unioverse.
struct Planet: Codable {

  /// The terrain of this planet. Comma-seperated if diverse.
  let terrain: String

  /// The average populationof sentient beings inhabiting this planet.
  let population: String

  /// The diameter of this planet in kilometers.
  let diameter: String

  /// The hypermedia URL of this resource.
  let url: String

  /// An array of `Person` URL Resources that live on this planet.
  let residents: [String]

  /// The climate of this planet. Comma-seperated if diverse.
  let climate: String

  /// The number of standard days it takes for this planet to complete a single orbit of its local star.
  let orbitalPeriod: String

  /// The timestamp for when this resource was last edited.
  let edited: Date

  /// An array of `Film` URL resources that this planet has appeared in.
  let films: [String]

  /// The percentage of the planet surface that is naturally occuring water or bodies of water.
  let surfaceWater: String

  /// A number denoting the gravity of this planet. Where 1 is normal.
  let gravity: String

  /// The timestamp for when this resource was created.
  let created: Date

  /// The number of standard hours it takes for this planet to complete a single rotation on its axis.
  let rotationPeriod: String

  /// The name of this planet.
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
