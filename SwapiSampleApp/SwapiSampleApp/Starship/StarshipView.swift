//
//  StarshipView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct StarshipView: View {

  @ObservedObject var viewModel: StarshipViewModel

  var body: some View {
    List {
      primaryInfoSection
      capacitySection
      speedSection
      pilotsSection
      filmsSection
    }
    .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchProperties()
    }
  }
}

extension StarshipView {
  var primaryInfoSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.name)
        Text(viewModel.model)
        Text(viewModel.manufacturer)
      }
    }
  }

  var capacitySection: some View {
    Section(header: Text("Size and Capacity")) {
      VStack(alignment: .leading, spacing: 12) {
        Text("Length: \(viewModel.length) m")
        Text("Crew: \(viewModel.crewSize)")
        Text("Passengers: \(viewModel.passengerCapacity)")
        Text("Consumables: \(viewModel.consumables)")
        Text("Cost: \(viewModel.cost) credits")
      }
    }
  }

  var speedSection: some View {
    Section(header: Text("Speed and Power")) {
      VStack(alignment: .leading, spacing: 12) {
        Text("Hyperdrive rating: \(viewModel.hyperdriveRating)")
        Text("\(viewModel.megalights) MGLT")
        Text("\(viewModel.maxSpeedAtmosphere) kph (atmospheric)")
      }
    }
  }

  var filmsSection: some View {
    Section(header: Text("Appears in")) {
      if viewModel.films.isEmpty {
        Text("No results")
      } else {
        ForEach(viewModel.films, id: \.self) { film in
          self.viewModel.rowView(forFilm: film)
        }
      }
    }
  }

  var pilotsSection: some View {
    Section(header: Text("Pilots")) {
      if viewModel.pilots.isEmpty {
        Text("No results")
      } else {
        ForEach(viewModel.pilots, id: \.self) { pilot in
          self.viewModel.rowView(forPilot: pilot)
        }
      }
    }
  }
}

struct StarshipView_Previews: PreviewProvider {
  static let vm: StarshipViewModel = {
    let falcon = sampleStarship("falcon")
    let dataService = MockGraphDataService(dataStore: falconData)
    let falconService = StarshipGraphService(
      starship: falcon,
      dataService: dataService
    )
    return StarshipViewModel(graphService: falconService)
  }()

  static var previews: some View {
    NavigationView {
      StarshipView(viewModel: vm)
    }
  }
}
