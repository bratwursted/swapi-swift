//
//  PlanetViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/6/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine

final class PlanetViewModel: ObservableObject {

  private let planetService: PlanetGraphService

  private var needsProperties = true

  private var disposables = Set<AnyCancellable>()

  private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    return formatter
  }()

  private var planet: Planet {
    planetService.planet
  }

  private let notAvailable = "n/a"

  @Published var residents: [Person] = []

  @Published var films: [Film] = []

  init(graphService: PlanetGraphService) {
    planetService = graphService
  }

  func fetchProperties() {
    guard needsProperties else { return }
    needsProperties = false

    planetService.fetchAssociatedProperties()

    planetService
    .$films
      .receive(on: DispatchQueue.main)
      .sink { films in
        self.films = films.sorted(by: { (film1, film2) -> Bool in
          film1.episodeId < film2.episodeId
        })
    }
    .store(in: &disposables)

    planetService
    .$residents
      .receive(on: DispatchQueue.main)
      .sink { people in
        self.residents = people.sorted(by: { (person1, person2) -> Bool in
          person1.name.compare(person2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)
  }

  var name: String {
    planet.name
  }

  var rotation: String {
    "\(planet.rotationPeriod) hrs."
  }

  var orbit: String {
    "\(planet.orbitalPeriod) days"
  }

  var diameter: String {
    guard planet.diameterValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: planet.diameterValue)) ?? notAvailable
  }

  var climate: String {
    planet.climate.localizedCapitalized
  }

  var gravity: String {
    "\(planet.gravity) gravity"
  }

  var terrain: [String] {
    planet.terrain.components(separatedBy: ",").map { $0.localizedCapitalized.trimmingCharacters(in: .whitespaces) }
  }

  var waterSurface: String {
    "\(planet.surfaceWater)% water"
  }

  var population: String {
    guard planet.populationValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: planet.populationValue)) ?? notAvailable
  }

  func rowView(for resident: Person) -> PersonRowView {
    let vm = PersonRowViewModel(character: resident)
    return PersonRowView(viewModel: vm)
  }

  func rowView(for film: Film) -> FilmRowView {
    let vm = FilmRowViewModel(film: film)
    return FilmRowView(viewModel: vm)
  }

}

extension Planet {

  var diameterValue: Int {
    Int(diameter) ?? 0
  }

  var populationValue: Int {
    Int(population) ?? 0
  }
}
