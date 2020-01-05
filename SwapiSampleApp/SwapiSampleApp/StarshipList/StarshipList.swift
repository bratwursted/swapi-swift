//
//  StarshipList.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct StarshipList: View {

  let viewModel: StarshipListViewModel

  var body: some View {
    List {
      ForEach(viewModel.starships, id: \.self) {
        self.viewModel.rowView(for: $0)
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct StarshipList_Previews: PreviewProvider {
  static var previews: some View {
    StarshipList(viewModel: StarshipListViewModel(
      starships: newHopeData[.starships] as! [Starship]
    ))
  }
}
