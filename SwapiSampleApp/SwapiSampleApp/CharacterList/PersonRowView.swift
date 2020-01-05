//
//  PersonRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI
import SwapiSwift

final class PersonRowViewModel {
  private let character: Person

  init(character: Person) {
    self.character = character
  }

  var name: String {
    character.name
  }
}

struct PersonRowView: View {

  let viewModel: PersonRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}
