//
//  PersonView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct PersonView: View {

  // TODO: needs navigation to detail views

  static var noResultsRow: some View {
    Text("No results")
  }

  @ObservedObject var viewModel: PersonViewModel

  var body: some View {
    List {
      personalSection
      vitalsSection
      homeSection
      speciesSection
      filmsSection
      starshipsSection
      vehiclesSection
    }
    .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchProperties()
    }
  }
}

extension PersonView {

  var personalSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.name)
        Text("Gender: \(viewModel.gender)")
        Text("Born: \(viewModel.birthYear)")
      }
    }
  }

  var homeSection: some View {
    Section(header: Text("Home world")) {
      if viewModel.homeworld != nil {
        Text(viewModel.homePlanet!)
      } else {
        Text("n/a")
      }
    }
  }

  var speciesSection: some View {
    Section(header: Text("Species")) {
      if viewModel.species.isEmpty {
        PersonView.noResultsRow
      } else {
        ForEach(viewModel.species, id: \.self) {
          self.viewModel.speciesRowView(for: $0)
        }
      }
    }
  }

  var vitalsSection: some View {
    Section(header: Text("Vital stats")) {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.height)
        Text(viewModel.mass)
        Text(viewModel.hair)
        Text(viewModel.eyes)
        Text(viewModel.skin)
      }
    }
  }

  var filmsSection: some View {
    Section(header: Text("Appears in")) {
      if viewModel.films.isEmpty {
        PersonView.noResultsRow
      } else {
        ForEach(viewModel.films, id: \.self) {
          self.viewModel.filmRowView(for: $0)
        }
      }
    }
  }

  var starshipsSection: some View {
    Section(header: Text("Starships")) {
      if viewModel.starships.isEmpty {
        PersonView.noResultsRow
      } else {
        ForEach(viewModel.starships, id: \.self) {
          self.viewModel.starshipRowView(for: $0)
        }
      }
    }
  }

  var vehiclesSection: some View {
    Section(header: Text("Vehicles")) {
      if viewModel.vehicles.isEmpty {
        PersonView.noResultsRow
      } else {
        ForEach(viewModel.vehicles, id: \.self) {
          self.viewModel.vehicleRowView(for: $0)
        }
      }
    }
  }
}

struct PersonView_Previews: PreviewProvider {
  static let vm: PersonViewModel = {
    let dataStore = lukeData
    let homeworld = samplePlanet("Tatooine")
    let dataService = MockGraphDataService(
      dataStore: dataStore,
      homeworld: homeworld
    )
    let graphService = PersonGraphService(
      person: samplePeople.results[0],
      dataService: dataService
    )
    return PersonViewModel(graphService: graphService)
  }()

  static var previews: some View {
    NavigationView {
      PersonView(viewModel: vm)
    }
  }
}
