//
//  Film.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a Star Wars film.
public struct Film: SwapiResource, Equatable, Hashable {

  /// The timestamp when this resource was created.
  public let created: Date

  /// An array of `Person` resource URLs representing the people featured in this film.
  public let characters: [String]

  /// The url of this resource.
  public let url: String

  /// The producer(s) of this film, comma separated if more than one.
  public let producer: String

  /// An array of `Starship` resource URLs  featured in this film.
  public let starships: [String]

  /// An array of `Planet` resource URLs featured in this film.
  public let planets: [String]

  /// The title of this film.
  public let title: String

  /// The release date ("yyyy-MM-dd" format) at original creator country.
  public let releaseDate: String

  /// The director of this film.
  public let director: String

  /// An array of `Species` URL resources featured in this film.
  public let species: [String]

  /// The opening crawl text at the beginning of this film.
  public let openingCrawl: String

  /// The timestamp of the last edit for this resource.
  public let edited: Date

  /// An array of `Vehicle` URL resources featured in this film.
  public let vehicles: [String]

  /// The episode number of this film.
  public let episodeId: Int

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
