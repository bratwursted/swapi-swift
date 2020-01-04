//
//  FilmInfoViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class FilmInfoViewModel {

  private let film: Film

  init(film: Film) {
    self.film = film
  }

  var filmTitle: String {
    "Episode \(film.episodeId)"
  }

  var episodeTitle: String {
    film.title
  }

  var crawl: String {
    film.openingCrawl
  }
}
