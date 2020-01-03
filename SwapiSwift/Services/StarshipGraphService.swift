//
//  StarshipGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

final class StarshipGraphService: GraphService {

  let starship: Starship

  private let dataService: SwapiService

  private var disposables = Set<AnyCancellable>()

  // Associated properties

  @Published var films: [Film] = []

  @Published var pilots: [Person] = []

  init(
    starship: Starship,
    dataService: SwapiService = DataService()
  ) {
    self.starship = starship
    self.dataService = dataService
  }

  func fetchAssociatedProperties() {

    // get films

    fetchFilms(
      from: dataService,
      with: starship.films,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.films = []
        case .finished:
          break
        }
    }, receiveValue: { films in
      self.films = films
    })
    .store(in: &disposables)

    // get pilots

    fetchPeople(
      from: dataService,
      with: starship.pilots,
      receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.handleError(error)
          self.pilots = []
        case .finished:
          break
        }
    }, receiveValue: { people in
      self.pilots = people
    })
    .store(in: &disposables)
  }
}
