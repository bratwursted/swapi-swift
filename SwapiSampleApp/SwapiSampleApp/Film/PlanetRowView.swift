//
//  PlanetRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

final class PlanetRowViewModel {
  private let planet: Planet

  init(planet: Planet) {
    self.planet = planet
  }

  var name: String {
    planet.name
  }
}

struct PlanetRowView: View {

  let viewModel: PlanetRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}

