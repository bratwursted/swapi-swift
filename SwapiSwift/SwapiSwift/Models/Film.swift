//
//  Film.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a Star Wars film.
struct Film: SwapiResource {

  /// The timestamp for when this resource was created.
  let created: Date

  /// An array of `Person` resource URLs  representing the people featured within this film.
  let characters: [String]

  /// The url of this resource.
  let url: String

  /// The producer(s) of this film.
  let producer: String

  /// An array of `Starship` URL resources featured within this film.
  let starships: [String]

  /// An array of `Planet` URL resources featured in the film.
  let planets: [String]

  /// The title of the film.
  let title: String

  /// The release date at original creator country.
  let releaseDate: String

  /// The director of this film.
  let director: String

  /// An array of `Species` URL resources featured in the film.
  let species: [String]

  /// The opening crawl text at the beginning of this film.
  let openingCrawl: String

  /// The timestamp for when this resource was last edited.
  let edited: Date

  /// An array of `Vehicle` URL resources featured in the film.
  let vehicles: [String]

  /// The episode number of this film.
  let episodeId: Int

  enum CodingKeys: String, CodingKey {
    case created
    case characters
    case url
    case producer
    case starships
    case planets
    case title
    case releaseDate = "release_date"
    case director
    case species
    case openingCrawl = "opening_crawl"
    case edited
    case vehicles
    case episodeId = "episode_id"
  }
}

extension Film {
  static let mockResourceUrl = "https://swapi.co/api/film/mock"

  static var mock: Film {
    Film(
      created: Date(),
      characters: [Person.mockResourceUrl],
      url: mockResourceUrl,
      producer: "Mock Producer",
      starships: [Starship.mockResourceUrl],
      planets: [Planet.mockResourceUrl],
      title: "Mock Title",
      releaseDate: "Mock Release Date",
      director: "Mock Director",
      species: [Species.mockResourceUrl],
      openingCrawl: "Mock Opening Crawl",
      edited: Date(),
      vehicles: [Vehicle.mockResourceUrl],
      episodeId: 1
    )
  }
}
