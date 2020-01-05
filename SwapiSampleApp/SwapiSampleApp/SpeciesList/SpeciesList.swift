//
//  SpeciesList.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct SpeciesList: View {

  let viewModel: SpeciesListViewModel

  var body: some View {
    List {
      ForEach(viewModel.species, id: \.self) {
        self.viewModel.rowView(for: $0)
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct SpeciesList_Previews: PreviewProvider {
  static var previews: some View {
    SpeciesList(viewModel: SpeciesListViewModel(
      species: newHopeData[.species] as! [Species]
    ))
  }
}
