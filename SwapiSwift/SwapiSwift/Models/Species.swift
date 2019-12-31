//
//  Species.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

struct Species: Codable {
  let films: [String]

  let created: String

  let url: String

  let designation: String

  let language: String

  let skinColors: String

  let hairColors: String

  let people: [String]

  let homeworld: String

  let edited: String

  let averageLifespan: String

  let averageHeight: String

  let classification: String

  let name: String

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
