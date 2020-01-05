//
//  FilmHeaderViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI

enum HeaderTitle: String {
  case characters = "Characters"
  case planets = "Planets"
  case species = "Species"
  case starships = "Starships"
  case vehicles = "Vehicles"
}

final class FilmHeaderViewModel {

  private let title: HeaderTitle

  let showsButton: Bool

  init(
    title: HeaderTitle,
    showsButton: Bool
  ) {
    self.title = title
    self.showsButton = showsButton
  }

  var headerTitle: String {
    title.rawValue
  }

  func seeAllButtonAction() {
    
  }

}
