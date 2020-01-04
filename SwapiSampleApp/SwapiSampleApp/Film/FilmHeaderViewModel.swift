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

  private let buttonStateClosure: (Bool) -> Void

  init(
    title: HeaderTitle,
    buttonStateClosure: @escaping (Bool) -> Void
  ) {
    self.title = title
    self.buttonStateClosure = buttonStateClosure
  }

  var headerTitle: String {
    title.rawValue
  }

}
