//
//  FilmViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine

final class FilmViewModel: ObservableObject {

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

  private let filmService: FilmGraphService

  private var film: Film {
    filmService.film
  }

  init(
    filmService: FilmGraphService
  ) {
    self.filmService = filmService
  }

  func fetchFilmProperties() {
    filmService.fetchAssociatedProperties()
  }

  var episideTitle: String {
    film.title
  }

  var filmTitle: String {
    "Episode \(episode)"
  }

  var formattedReleaseDate: String {
    outputFormatter.string(from: releaseDate)
  }

  var director: String {
    film.director
  }

  var producers: String {
    film.producer
  }

  var crawlSnipet: String {
    film.openingCrawl.firstSentence ?? "n/a"
  }

  func filmInfoView() -> FilmInfoView {
    let vm = FilmInfoViewModel(film: film)
    return FilmInfoView(viewModel: vm)
  }

  private var releaseDate: Date {
    formatter.date(from: film.releaseDate)!
  }

  private var episode: String {
    String(film.episodeId)
  }
}

private extension String {

  var firstSentence: String? {
    sentences.first
  }

  var sentences: [String] {
    let range = self.startIndex..<self.endIndex
    var sentences: [String] = []
    self.enumerateSubstrings(in: range, options: .bySentences) { (substring, range, enclosingRange, stopPointer) in
      if let sentence = substring {
        sentences.append(sentence.trimmingCharacters(in: .whitespacesAndNewlines))
      }
    }
    return sentences
  }
}
