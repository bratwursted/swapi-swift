//
//  CharacterList.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct CharacterList: View {

  let viewModel: CharacterListViewModel

  var body: some View {
    List {
      ForEach(viewModel.characters, id: \.self) { character in
        NavigationLink(destination: self.viewModel.personView(for: character)) {
          self.viewModel.rowView(for: character)
        }
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct CharacterList_Previews: PreviewProvider {
  static var previews: some View {
    CharacterList(viewModel: CharacterListViewModel(
      characters: newHopeData[.people] as! [Person]
    ))
  }
}
