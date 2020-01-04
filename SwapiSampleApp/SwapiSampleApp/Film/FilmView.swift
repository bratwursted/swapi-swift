//
//  FilmView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct FilmView: View {

  let viewModel: FilmViewModel

  var body: some View {
    List {
      basicInfoSection
      productionSection
    }
    .navigationBarTitle(Text(viewModel.filmTitle), displayMode: .inline)
  }

  var basicInfoSection: some View {
    Section {
      NavigationLink(destination: viewModel.filmInfoView()) {
        VStack(alignment: .leading, spacing: 12) {
          Text(viewModel.episideTitle)
            .font(.title)
          Text(viewModel.filmTitle)
            .font(.body)
          Text("\"\(viewModel.crawlSnipet)\"")
            .font(.subheadline)
        }
      }
    }
  }

  var productionSection: some View {
    Section(header: Text("Production Details")) {
      VStack(alignment: .leading, spacing: 12) {
        Text("Released: \(viewModel.formattedReleaseDate)")
        Text("Director: \(viewModel.director)")
        Text("Producers: \(viewModel.producers)")
      }
    }
  }

}

struct FilmView_Previews: PreviewProvider {
  static var previews: some View {
    let film = sampleFilms.results[0]
    let dataService = MockGraphDataService(dataStore: newHopeData)
    let service = FilmGraphService(film: film, dataService: dataService)
    return FilmView(viewModel: FilmViewModel(filmService: service))
  }
}
