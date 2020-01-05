//
//  PlanetListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class PlanetListViewModel {

  let planets: [Planet]

  init(planets: [Planet]) {
    self.planets = planets
  }

  func rowView(for planet: Planet) -> PlanetRowView {
    let vm = PlanetRowViewModel(planet: planet)
    return PlanetRowView(viewModel: vm)
  }

  var viewTitle: String {
    "Planets"
  }
}
