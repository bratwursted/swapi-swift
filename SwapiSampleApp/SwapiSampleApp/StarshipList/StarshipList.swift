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
      ForEach(viewModel.starships, id: \.self) { starship in
        NavigationLink(
        destination: self.viewModel.linkDestination(for: starship)
        ) {
          self.viewModel.rowView(for: starship)
        }
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
