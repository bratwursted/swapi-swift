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

  static let maxSectionItems = 3

  @ObservedObject var viewModel: FilmViewModel

  @State var navigationTag: Int?

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
      if self.viewModel.needsAssociatedProperties {
        self.viewModel.fetchFilmProperties()
      }
    }
  }

}

extension FilmView {

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
    Section(header: charactersHeader) {
      ForEach(0..<maximumRowIndex(self.viewModel.characters)) {
        self.viewModel.characterRowView(forIndex: $0)
      }
    }
  }

  var charactersHeader: some View {
    HStack {
      Text(NavigationDestination.characters.title)
      Spacer()
      if viewModel.characters.count > FilmView.maxSectionItems {
        NavigationLink(
          destination: viewModel.characterList,
          tag: NavigationDestination.characters.tag,
          selection: $navigationTag) {
            headerButton(forDestination: .characters)
        }
      }
    }
  }

  var planetsSection: some View {
    Section(header: planetsHeader) {
      ForEach(0..<maximumRowIndex(self.viewModel.planets)) {
        self.viewModel.planetRowView(forIndex: $0)
      }
    }
  }

  var planetsHeader: some View {
    HStack {
      Text(NavigationDestination.planets.title)
      Spacer()
      if viewModel.planets.count > FilmView.maxSectionItems {
        NavigationLink(
          destination: viewModel.planetList,
          tag: NavigationDestination.planets.tag,
          selection: $navigationTag) {
            headerButton(forDestination: .planets)
        }
      }
    }
  }

  var speciesSection: some View {
    Section(header: speciesHeader) {
      ForEach(0..<maximumRowIndex(self.viewModel.species)) {
        self.viewModel.speciesRowView(forIndex: $0)
      }
    }
  }

  var speciesHeader: some View {
    HStack {
      Text(NavigationDestination.species.title)
      Spacer()
      if viewModel.species.count > FilmView.maxSectionItems {
        NavigationLink(
          destination: viewModel.speciesList,
          tag: NavigationDestination.species.tag,
          selection: $navigationTag) {
            headerButton(forDestination: .species)
        }
      }
    }
  }

  var starshipsSection: some View {
    Section(header: starshipsHeader) {
      ForEach(0..<maximumRowIndex(self.viewModel.starships)) {
        self.viewModel.starshipRowView(forIndex: $0)
      }
    }
  }

  var starshipsHeader: some View {
    HStack {
      Text(NavigationDestination.starships.title)
      Spacer()
      if viewModel.starships.count > FilmView.maxSectionItems {
        NavigationLink(
          destination: StarshipList(),
          tag: NavigationDestination.starships.tag,
          selection: $navigationTag) {
            headerButton(forDestination: .starships)
        }
      }
    }
  }

  var vehiclesSection: some View {
    Section(header: vehiclesSectionHeader) {
      ForEach(0..<maximumRowIndex(self.viewModel.vehicles)) {
        self.viewModel.vehicleRowView(forIndex: $0)
      }
    }
  }

  var vehiclesSectionHeader: some View {
    HStack {
      Text(NavigationDestination.vehicles.title)
      if viewModel.vehicles.count > FilmView.maxSectionItems {
        Spacer()
        NavigationLink(
          destination: VehicleList(),
          tag: NavigationDestination.vehicles.tag,
          selection: $navigationTag) {
            headerButton(forDestination: .vehicles)
        }
      }
    }
  }

  func emptySection(withTitle title: NavigationDestination.HeaderTitle) -> some View {
    Section(header: Text(title.rawValue)) {
      Text("no results")
    }
  }

  func headerButton(forDestination destination: NavigationDestination) -> Button<HeaderButtonView> {
    Button(action: {
      self.navigationTag = destination.tag
    }) {
      HeaderButtonView()
    }
  }

  func maximumRowIndex(_ array: [Any]) -> Int {
    min(array.count, FilmView.maxSectionItems)
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
