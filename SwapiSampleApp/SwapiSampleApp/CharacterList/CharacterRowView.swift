//
//  CharacterRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI
import SwapiSwift

final class CharacterRowViewModel {
  private let character: Person

  init(character: Person) {
    self.character = character
  }

  var name: String {
    character.name
  }
}

struct CharacterRowView: View {

  let viewModel: CharacterRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}
