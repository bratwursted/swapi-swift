//
//  SwapiRoot.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents a response for the SW API root (i.e., GET /api/) containing URLs to all available resources.
public struct SwapiRoot: Codable {

  /// The root URL for people resources.
  public let people: String

  /// The root URL for planet resources.
  public let planets: String

  /// The root URL for films resources.
  public let films: String

  /// The root URL for species resources.
  public let species: String

  /// The root URL for vehicles resources.
  public let vehicles: String

  /// The root URL for starships resources.
  public let starships: String

}
