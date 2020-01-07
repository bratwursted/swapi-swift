//
//  VehicleViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift
import Combine

final class VehicleViewModel: ObservableObject {

  private let notAvailable = "n/a"

  private let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    return formatter
  }()

  private let vehicleGraph: VehicleGraphService

  private var vehicle: Vehicle {
    vehicleGraph.vehicle
  }

  private var needsProperties = true

  private var disposables = Set<AnyCancellable>()

  @Published var films: [Film] = []

  @Published var pilots: [Person] = []

  init(graphService: VehicleGraphService) {
    vehicleGraph = graphService
  }

  func fetchProperties() {
    guard needsProperties else { return }
    needsProperties = false

    vehicleGraph.fetchAssociatedProperties()

    vehicleGraph
      .$films
      .receive(on: DispatchQueue.main)
      .sink { films in
        self.films = films.sorted(by: { (film1, film2) -> Bool in
          film1.episodeId < film2.episodeId
        })
    }
    .store(in: &disposables)

    vehicleGraph
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
    vehicle.name
  }

  var model: String {
    vehicle.model
  }

  var manufacturer: String {
    vehicle.manufacturer
  }

  var cost: String {
    guard vehicle.costValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: vehicle.costValue)) ?? notAvailable
  }

  var length: String {
    vehicle.length
  }

  var maximimSpeed: String {
    guard vehicle.maxSpeedValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: vehicle.maxSpeedValue)) ?? notAvailable
  }

  var crew: String {
    vehicle.crew
  }

  var passengers: String {
    vehicle.passengers
  }

  var cargo: String {
    guard vehicle.cargoCapacityValue > 0 else {
      return notAvailable
    }
    return formatter.string(from: NSNumber(integerLiteral: vehicle.cargoCapacityValue)) ?? notAvailable
  }

  var consumables: String {
    vehicle.consumables
  }

  var vehicleClass: String {
    vehicle.vehicleClass.localizedCapitalized
  }

  func rowView(forPilot pilot: Person) -> PersonRowView {
    let vm = PersonRowViewModel(character: pilot)
    return PersonRowView(viewModel: vm)
  }

  func rowView(forFilm film: Film) -> FilmRowView {
    let vm = FilmRowViewModel(film: film)
    return FilmRowView(viewModel: vm)
  }
}

extension Vehicle {

  var cargoCapacityValue: Int {
    Int(cargoCapacity) ?? 0
  }

  var costValue: Int {
    Int(cost) ?? 0
  }

  var maxSpeedValue: Int {
    Int(maximumAtmosphericSpeed) ?? 0
  }
}
