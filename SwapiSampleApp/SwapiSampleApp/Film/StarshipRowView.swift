//
//  StarshipRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI
import SwapiSwift

final class StarshipRowViewModel {

  private let starship: Starship

  init(starship: Starship) {
    self.starship = starship
  }

  var name: String {
    starship.name
  }
}

struct StarshipRowView: View {

  let viewModel: StarshipRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}
