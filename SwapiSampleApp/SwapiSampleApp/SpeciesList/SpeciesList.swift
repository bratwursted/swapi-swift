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
      ForEach(viewModel.species, id: \.self) { species in
        NavigationLink(destination: self.viewModel.destinationView(for: species)) {
          self.viewModel.rowView(for: species)
        }
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct SpeciesList_Previews: PreviewProvider {
  static let vm: SpeciesListViewModel = {
    SpeciesListViewModel(species: newHopeData[.species] as! [Species])
  }()
  
  static var previews: some View {
    NavigationView {
      SpeciesList(viewModel: vm)
    }
  }
}
