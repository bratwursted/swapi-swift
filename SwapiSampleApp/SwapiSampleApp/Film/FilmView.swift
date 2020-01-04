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

  enum HeaderTitle: String {
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
        emptySection(withTitle: .characters)
      } else {
        charactersSection
      }

      if viewModel.planets.isEmpty {
        emptySection(withTitle: .planets)
      } else {
        planetsSection
      }

      if viewModel.species.isEmpty {
        emptySection(withTitle: .species)
      } else {
        speciesSection
      }

      if viewModel.starships.isEmpty {
        emptySection(withTitle: .starships)
      } else {
        starshipsSection
      }

      if viewModel.vehicles.isEmpty {
        emptySection(withTitle: .vehicles)
      } else {
        vehiclesSection
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
      ForEach(0..<maximumRowIndex(self.viewModel.characters)) {
        self.viewModel.characterRowView(forIndex: $0)
      }
    }
  }

  var planetsSection: some View {
    Section(header: Text(HeaderTitle.planets.rawValue)) {
      ForEach(0..<maximumRowIndex(self.viewModel.planets)) {
        self.viewModel.planetRowView(forIndex: $0)
      }
    }
  }

  var speciesSection: some View {
    Section(header: Text(HeaderTitle.species.rawValue)) {
      ForEach(0..<maximumRowIndex(self.viewModel.species)) {
        self.viewModel.speciesRowView(forIndex: $0)
      }
    }
  }

  var starshipsSection: some View {
    Section(header: Text(HeaderTitle.starships.rawValue)) {
      ForEach(0..<maximumRowIndex(self.viewModel.starships)) {
        self.viewModel.starshipRowView(forIndex: $0)
      }
    }
  }

  var vehiclesSection: some View {
    Section(header: Text(HeaderTitle.vehicles.rawValue)) {
      ForEach(0..<maximumRowIndex(self.viewModel.vehicles)) {
        self.viewModel.vehicleRowView(forIndex: $0)
      }
    }
  }

  func emptySection(withTitle title: HeaderTitle) -> some View {
    Section(header: Text(title.rawValue)) {
      Text("no results")
    }
  }

  func maximumRowIndex(_ array: [Any]) -> Int {
    min(array.count, 3)
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
