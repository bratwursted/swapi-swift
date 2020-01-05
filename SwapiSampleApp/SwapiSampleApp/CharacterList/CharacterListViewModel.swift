//
//  CharacterListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class CharacterListViewModel {

  let characters: [Person]

  init(characters: [Person]) {
    self.characters = characters
  }

  func rowView(for character: Person) -> PersonRowView {
    let vm = PersonRowViewModel(character: character)
    return PersonRowView(viewModel: vm)
  }

  var viewTitle: String {
    "Characters"
  }
}
