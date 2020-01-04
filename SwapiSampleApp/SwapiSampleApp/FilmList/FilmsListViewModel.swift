//
//  FilmsListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine
import SwapiSwift

final class FilmsListViewModel: ObservableObject, Identifiable {

  @Published var films: [Film] = []

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  init(dataService: SwapiService) {
    self.dataService = dataService
  }

  func loadFilms() {
    dataService.allFilms(page: nil)
      .map { response in
        response.results
          .sorted(by: { film1, film2 in
            film1.episodeId < film2.episodeId
          })
    }
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: { completion in
      switch completion {
      case .failure(let error):
        print("There was an error: \(error)")
        self.films = []
      case .finished:
        break
      }
    }, receiveValue: { films in
      self.films = films
    })
      .store(in: &disposables)
  }

  func filmView(forFilm film: Film) -> FilmView {
    let service = FilmGraphService(film: film)
    let vm = FilmViewModel(filmService: service)
    return FilmView(viewModel: vm)
  }
}
