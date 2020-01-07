//
//  StarshipViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine

final class StarshipViewModel: ObservableObject {

  private let notAvailable = "n/a"

  private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    return formatter
  }()

  private let starshipService: StarshipGraphService

  private var starship: Starship {
    starshipService.starship
  }

  private var disposables = Set<AnyCancellable>()

  private var needsProperties = true

  @Published var films: [Film] = []

  @Published var pilots: [Person] = []

  init(graphService: StarshipGraphService) {
    starshipService = graphService
  }

  func fetchProperties() {
    guard needsProperties else { return }
    needsProperties = false

    starshipService.fetchAssociatedProperties()

    starshipService
      .$films
      .receive(on: DispatchQueue.main)
      .sink { films in
        self.films = films.sorted(by: { (film1, film2) -> Bool in
          film1.episodeId < film2.episodeId
        })
    }
    .store(in: &disposables)

    starshipService
      .$pilots
      .receive(on: DispatchQueue.main)
      .sink { people in
        self.pilots = people.sorted(by: { (person1, person2) -> Bool in
          person1.name.compare(person2.name, options: .caseInsensitive) == .orderedAscending
        })
    }
    .store(in: &disposables)

  }

  var name: String {
    starship.name
  }

  var model: String {
    starship.model
  }

  var manufacturer: String {
    starship.manufacturer
  }

  var cost: String {
    guard starship.costValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.costValue)) ?? notAvailable
  }

  var length: String {
    guard starship.lengthValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.lengthValue)) ?? notAvailable
  }

  var maxSpeedAtmosphere: String {
    guard starship.maxSpeedAtmosphereValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.maxSpeedAtmosphereValue)) ?? notAvailable
  }

  var crewSize: String {
    guard starship.crewValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.crewValue)) ?? notAvailable
  }

  var passengerCapacity: String {
    guard starship.passengersValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.passengersValue)) ?? notAvailable
  }

  var cargoCapacity: String {
    guard starship.cargoValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.cargoValue)) ?? notAvailable
  }

  var consumables: String {
    starship.consumables
  }

  var hyperdriveRating: String {
    starship.hyperdriveRating
  }

  var megalights: String {
    guard starship.megalightsValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: starship.megalightsValue)) ?? notAvailable
  }

  var starshipClass: String {
    starship.starshipClass
  }

  func rowView(forFilm film: Film) -> FilmRowView {
    let vm = FilmRowViewModel(film: film)
    return FilmRowView(viewModel: vm)
  }

  func rowView(forPilot pilot: Person) -> PersonRowView {
    let vm = PersonRowViewModel(character: pilot)
    return PersonRowView(viewModel: vm)
  }
}

extension Starship {

  var megalightsValue: Int {
    Int(maximumMegalights) ?? 0
  }

  var maxSpeedAtmosphereValue: Int {
    Int(maximumAtmosphericSpeed) ?? 0
  }

  var lengthValue: Int {
    Int(length) ?? 0
  }

  var passengersValue: Int {
    Int(passengers) ?? 0
  }

  var crewValue: Int {
    Int(crew) ?? 0
  }

  var cargoValue: Int {
    Int(cargoCapacity) ?? 0
  }

  var costValue: Int {
    Int(cost) ?? 0
  }
}
