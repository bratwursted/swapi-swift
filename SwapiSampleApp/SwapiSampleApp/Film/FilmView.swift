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

  private enum HeaderTitle: String {
    case characters = "Characters"
    case planets = "Planets"
    case species = "Species"
    case starships = "Starships"
    case vehicles = "Vehicles"
  }

  @ObservedObject var viewModel: FilmViewModel

  var body: some View {
    List {
      basicInfoSection
      productionSection

      if viewModel.characters.isEmpty {
        emptySection(withTitle: HeaderTitle.characters.rawValue)
      } else {
        charactersSection
      }

      if viewModel.planets.isEmpty {
        emptySection(withTitle: HeaderTitle.planets.rawValue)
      } else {
        planetsSection
      }
    }
    .navigationBarTitle(Text(viewModel.filmTitle), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchFilmProperties()
    }
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

  var charactersSection: some View {
    Section(header: Text(HeaderTitle.characters.rawValue)) {
      ForEach(0..<3) {
        self.viewModel.characterRowView(forIndex: $0)
      }
    }
  }

  var planetsSection: some View {
    Section(header: Text(HeaderTitle.planets.rawValue)) {
      ForEach(0..<3) {
        self.viewModel.planetRowView(forIndex: $0)
      }
    }
  }

  func emptySection(withTitle title: String) -> some View {
    Section(header: Text(title)) {
      Text("no results")
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
