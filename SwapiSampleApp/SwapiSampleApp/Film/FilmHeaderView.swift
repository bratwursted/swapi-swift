//
//  FilmHeaderView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI

struct FilmHeaderView: View {

  let viewModel: FilmHeaderViewModel

  var body: some View {
    HStack {
      Text(viewModel.headerTitle)
        .font(.body)
        .fontWeight(.semibold)
      Spacer()
      if viewModel.showsButton {
        Button(action: {
          self.viewModel.seeAllButtonAction()
        }, label: {
          HStack {
            Text("See all")
              .font(.callout)
            Image(systemName: "chevron.right")
              .font(.footnote)
          }
        })
      }
    }
  }
}

struct FilmHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    FilmHeaderView(viewModel: FilmHeaderViewModel(title: .characters, showsButton: true))
  }
}
