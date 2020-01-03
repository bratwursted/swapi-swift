//
//  FilmResultView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI

struct FilmResultView: View {
    let viewModel: FilmResultViewModel

    var body: some View {
      VStack(alignment: .leading) {
        Text(viewModel.filmTitle)
          .font(.body)
        Text(viewModel.episodeTitle)
          .font(.title)
        Text(viewModel.formattedReleaseDate)
      }
    }
}

struct FilmResultsView_Previews: PreviewProvider {
    static var previews: some View {
      FilmResultView(viewModel: FilmResultViewModel(film: sampleFilms.results[0]))
    }
}
