//
//  Planet.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a planet in the Star Wars unioverse.
public struct Planet: SwapiResource {

  /// The terrain of this planet. Comma-seperated if diverse.
  public let terrain: String

  /// The average populationof sentient beings inhabiting this planet.
  public let population: String

  /// The diameter of this planet in kilometers.
  public let diameter: String

  /// The hypermedia URL of this resource.
  public let url: String

  /// An array of `Person` URL Resources that live on this planet.
  public let residents: [String]

  /// The climate of this planet. Comma-seperated if diverse.
  public let climate: String

  /// The number of standard days it takes for this planet to complete a single orbit of its local star.
  public let orbitalPeriod: String

  /// The timestamp for when this resource was last edited.
  public let edited: Date

  /// An array of `Film` URL resources that this planet has appeared in.
  public let films: [String]

  /// The percentage of the planet surface that is naturally occuring water or bodies of water.
  public let surfaceWater: String

  /// A number denoting the gravity of this planet. Where 1 is normal.
  public let gravity: String

  /// The timestamp for when this resource was created.
  public let created: Date

  /// The number of standard hours it takes for this planet to complete a single rotation on its axis.
  public let rotationPeriod: String

  /// The name of this planet.
  public let name: String

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

extension Planet {
  static let mockResourceUrl = "https://swapi.co/api/planets/mock"

  static var mock: Planet {
    Planet(
      terrain: "Mock Terrain",
      population: "Mock Population",
      diameter: "Mock Diameter",
      url: mockResourceUrl,
      residents: [Person.mockResourceUrl],
      climate: "Mock Climate",
      orbitalPeriod: "Mock Orbital Period",
      edited: Date(),
      films: [Film.mockResourceUrl],
      surfaceWater: "Mock Surface Water",
      gravity: "Mock Gravity",
      created: Date(),
      rotationPeriod: "Mock Rotation Period",
      name: "Mock Planet Name"
    )
  }
}
