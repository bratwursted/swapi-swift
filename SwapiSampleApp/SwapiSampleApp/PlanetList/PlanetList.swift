//
//  PlanetList.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct PlanetList: View {

  let viewModel: PlanetListViewModel

  var body: some View {
    List {
      ForEach(viewModel.planets, id: \.self) { planet in
        NavigationLink(destination: self.viewModel.destination(for: planet)) {
          self.viewModel.rowView(for: planet)
        }
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct PlanetList_Previews: PreviewProvider {
  static var previews: some View {
    PlanetList(viewModel: PlanetListViewModel(planets: newHopeData[.planets] as! [Planet]))
  }
}
