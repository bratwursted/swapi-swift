//
//  Species.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a species featured in the Star Wars universe.
public struct Species: SwapiResource {

  ///  An array of `Film` URL resources that this species has appeared in.
  public let films: [String]

  /// The timestamp when this resource was created.
  public let created: Date

  /// The URL for this resource.
  public let url: String

  /// The designation of this species.
  public let designation: String

  /// The language commonly spoken by this species.
  public let language: String

  /// A comma-seperated string of common skin colors for this species, none if this species does not typically have skin.
  public let skinColors: String

  /// A comma-seperated string of common hair colors for this species, none if this species does not typically have hair.
  public let hairColors: String

  /// An array of `Person` URL resources that are a part of this species.
  public let people: [String]

  /// The URL of a planet resource, a planet that this species originates from.
  public let homeworld: String?

  /// Timestamp when this resource was last edited.
  public let edited: Date

  // The average lifespan of this species in years.
  public let averageLifespan: String

  /// The average height of this person in centimeters.
  public let averageHeight: String

  /// The classification of this species.
  public let classification: String

  /// The name of this species.
  public let name: String

  /// A comma-seperated string of common eye colors for this species, none if this species does not typically have eyes.
  public let eyeColors: String

  enum CodingKeys: String, CodingKey {
    case films
    case created
    case url
    case designation
    case language
    case skinColors = "skin_colors"
    case hairColors = "hair_colors"
    case people
    case homeworld
    case edited
    case averageLifespan = "average_lifespan"
    case averageHeight = "average_height"
    case classification
    case name
    case eyeColors = "eye_colors"
  }
}

extension Species {
  static let mockResourceUrl = "https://swapi.co/api/species/mock"

  static var mock: Species {
    Species(
      films: [Film.mockResourceUrl],
      created: Date(),
      url: mockResourceUrl,
      designation: "Mock Species Designation",
      language: "Mock Language",
      skinColors: "Mock Skin Colors",
      hairColors: "Mock Hair Colors",
      people: [Person.mockResourceUrl],
      homeworld: Planet.mockResourceUrl,
      edited: Date(),
      averageLifespan: "Mock Average Lifespan",
      averageHeight: "Mock Average Height",
      classification: "Mock Classification",
      name: "Mock Species Name",
      eyeColors: "Mock Eye Colors"
    )
  }
}
