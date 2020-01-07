//
//  SpeciesVIewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/6/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine

final class SpeciesViewModel: ObservableObject {

  private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    return formatter
  }()

  private let speciesService: SpeciesGraphService

  private var species: Species {
    speciesService.species
  }

  private var disposables = Set<AnyCancellable>()

  private var needsProperties = true

  @Published var films: [Film] = []

  @Published var people: [Person] = []

  @Published var homeworld: Planet?

  init(graphService: SpeciesGraphService) {
    speciesService = graphService
  }

  func fetchProperties() {
    guard needsProperties else { return }
    needsProperties = false

    speciesService.fetchAssociatedProperties()

    speciesService
      .$films
      .receive(on: DispatchQueue.main)
      .sink { films in
        self.films = films.sorted(by: { (film1, film2) -> Bool in
          film1.episodeId < film2.episodeId
        })
    }
    .store(in: &disposables)

    speciesService
      .$people
      .receive(on: DispatchQueue.main)
      .sink { people in
        self.people = people.sorted(by: { (person1, person2) -> Bool in
          person1.name.compare(person2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

    speciesService
      .$homeworld
      .receive(on: DispatchQueue.main)
      .sink { planet in
        self.homeworld = planet
    }
    .store(in: &disposables)
  }

  var name: String {
    species.name
  }

  var classification: String {
    species.classification.localizedCapitalized
  }

  var designation: String {
    species.designation.localizedCapitalized
  }

  var height: String {
    guard species.heightMeters > 0 else {
      return "n/a"
    }
    return "\(species.heightMeters) m"
  }

  var skinColors: [String] {
    species.skinColors.split(separator: ",").map { $0.localizedCapitalized.trimmingCharacters(in: .whitespaces) }
  }

  var hairColors: [String] {
    species.hairColors.split(separator: ",").map { $0.localizedCapitalized.trimmingCharacters(in: .whitespaces) }
  }

  var eyeColors: [String] {
    species.eyeColors.split(separator: ",").map { $0.localizedCapitalized.trimmingCharacters(in: .whitespaces) }
  }

  var lifespan: String {
    guard species.lifespanValue > 0 else {
      return "n/a"
    }
    return formatter.string(from: NSNumber(integerLiteral: species.lifespanValue)) ?? "n/a"
  }

  var language: String {
    species.language
  }

  var homePlanet: String {
    homeworld?.name ?? "n/a"
  }

  func rowView(for person : Person) -> PersonRowView {
    let vm = PersonRowViewModel(character: person)
    return PersonRowView(viewModel: vm)
  }

  func rowView(for film: Film) -> FilmRowView {
    let vm = FilmRowViewModel(film: film)
    return FilmRowView(viewModel: vm)
  }
}

extension Species {

  var lifespanValue: Int {
    Int(averageLifespan) ?? 0
  }

  var heightMeters: Float {
    return averageHeightValue / 100
  }

  var averageHeightValue: Float {
    Float(averageHeight) ?? 0
  }
}
