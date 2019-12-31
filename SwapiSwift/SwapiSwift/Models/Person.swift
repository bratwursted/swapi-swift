//
//  Person.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

struct Person: Codable {
  let hairColor: String

  let films: [Film]

  let mass: String

  let gender: String

  let url: String

  let edited: String

  let starships: [Starship]

  let homeworld: String

  let created: String

  let birthYear: String

  let vehicles: [Vehicle]

  let species: [Species]

  let name: String

  let height: String

  let eyeColor: String

  let skinColor: String

  enum CodingKeys: String, CodingKey {
    case hairColor = "hair_color"
    case films
    case mass
    case gender
    case url
    case edited
    case starships
    case homeworld
    case created
    case birthYear = "birth_year"
    case vehicles
    case species
    case name
    case height
    case eyeColor = "eye_color"
    case skinColor = "skin_color"
  }
}
