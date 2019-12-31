//
//  Species.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a species featured in the Star Wars universe.
struct Species: Codable {

  ///  An array of `Film` URL resources that this species has appeared in.
  let films: [String]

  /// The timestamp when this resource was created.
  let created: Date

  /// The URL for this resource.
  let url: String

  /// The designation of this species.
  let designation: String

  /// The language commonly spoken by this species.
  let language: String

  /// A comma-seperated string of common skin colors for this species, none if this species does not typically have skin.
  let skinColors: String

  /// A comma-seperated string of common hair colors for this species, none if this species does not typically have hair.
  let hairColors: String

  /// An array of `Person` URL resources that are a part of this species.
  let people: [String]

  /// The URL of a planet resource, a planet that this species originates from.
  let homeworld: String

  /// Timestamp when this resource was last edited.
  let edited: Date

  // The average lifespan of this species in years.
  let averageLifespan: String

  /// The average height of this person in centimeters.
  let averageHeight: String

  /// The classification of this species.
  let classification: String

  /// The name of this species.
  let name: String

  /// A comma-seperated string of common eye colors for this species, none if this species does not typically have eyes.
  let eyeColors: String

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
