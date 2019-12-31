//
//  SwapiRoot.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents a response for the SW API root (i.e., GET /api/) containing URLs to all available resources.
struct SwapiRoot: Codable {

  /// The root URL for people resources.
  let people: String

  /// The root URL for planet resources.
  let planets: String

  /// The root URL for films resources.
  let films: String

  /// The root URL for species resources.
  let species: String

  /// The root URL for vehicles resources.
  let vehicles: String

  /// The root URL for starships resources.
  let starships: String

}
