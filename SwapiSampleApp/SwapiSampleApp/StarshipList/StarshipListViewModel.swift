//
//  StarshipListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class StarshipListViewModel {

  let starships: [Starship]

  init(starships: [Starship]) {
    self.starships = starships
  }

  func rowView(for starship: Starship) -> StarshipRowView {
    StarshipRowView(viewModel: StarshipRowViewModel(starship: starship))
  }

  var viewTitle: String {
    "Starships"
  }
}
