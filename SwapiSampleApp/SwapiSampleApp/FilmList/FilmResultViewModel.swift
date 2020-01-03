//
//  FilmResultViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class FilmResultViewModel: Identifiable {
  private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()

  private let outputFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  private var film: Film

  private var releaseDate: Date {
    formatter.date(from: film.releaseDate) ?? Date()
  }

  init(film: Film) {
    self.film = film
  }

  var filmTitle: String {
    "Episode \(episodeNumber)"
  }

  var episodeNumber: String {
    String(film.episodeId)
  }

  var releaseYear: String {
    let calendar = Calendar.current
    return String(calendar.component(.year, from: releaseDate))
  }

  var formattedReleaseDate: String {
    outputFormatter.string(from: releaseDate)
  }

  var episodeTitle: String {
    film.title
  }
}

