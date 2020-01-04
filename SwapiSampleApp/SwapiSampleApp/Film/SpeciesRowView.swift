//
//  SpeciesRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI
import SwapiSwift

final class SpeciesRowViewModel {

  private let species: Species

  init(species: Species) {
    self.species = species
  }

  var name: String {
    species.name
  }
}

struct SpeciesRowView: View {

  let viewModel: SpeciesRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}
