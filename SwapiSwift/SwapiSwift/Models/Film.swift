//
//  Film.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

struct Film: Codable {
  let created: Date

  let characters: [String]

  let url: String

  let producer: String

  let starships: [String]

  let planets: [String]

  let title: String

  let releaseDate: String

  let director: String

  let species: [String]

  let openingCrawl: String

  let edited: Date

  let vehicles: [String]

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
