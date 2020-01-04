//
//  FilmInfoView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI

struct FilmInfoView: View {

  let viewModel: FilmInfoViewModel

  var body: some View {
    List {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.episodeTitle)
          .font(.title)
        Text(viewModel.filmTitle)
          .font(.subheadline)
        Text(viewModel.crawl)
          .font(.body)
      }
    }
  }
}

struct FilmInfoView_Previews: PreviewProvider {
  static var previews: some View {
    let film = sampleFilms.results[0]
    let viewModel = FilmInfoViewModel(film: film)
    return FilmInfoView(viewModel: viewModel)
  }
}
