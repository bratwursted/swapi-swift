//
//  NavigationDestination.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation

enum NavigationDestination {
  case characters
  case films
  case planets
  case species
  case starships
  case vehicles

  var tag: Int {
    switch self {
    case .characters:
      return 1
    case .films:
      return 2
    case .planets:
      return 3
    case .species:
      return 4
    case .starships:
      return 5
    case .vehicles:
      return 6
    }
  }

  enum HeaderTitle: String {
    case characters = "Characters"
    case films = "Films"
    case planets = "Planets"
    case species = "Species"
    case starships = "Starships"
    case vehicles = "Vehicles"
  }

  var title: String {
    switch self {
    case .characters:
      return HeaderTitle.characters.rawValue
    case .films:
      return HeaderTitle.films.rawValue
    case .planets:
      return HeaderTitle.planets.rawValue
    case .species:
      return HeaderTitle.species.rawValue
    case .starships:
      return HeaderTitle.starships.rawValue
    case .vehicles:
      return HeaderTitle.vehicles.rawValue
    }
  }
}
