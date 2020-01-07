//
//  SpeciesListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class SpeciesListViewModel {

  let species: [Species]

  init(species: [Species]) {
    self.species = species
  }

  func rowView(for aSpecies: Species) -> SpeciesRowView {
    SpeciesRowView(viewModel: SpeciesRowViewModel(species: aSpecies))
  }

  var viewTitle: String {
    "Species"
  }

  func destinationView(for aSpecies: Species) -> SpeciesView {
    let graphService = SpeciesGraphService(species: aSpecies)
    let vm = SpeciesViewModel(graphService: graphService)
    return SpeciesView(viewModel: vm)
  }
}
