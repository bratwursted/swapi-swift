//
//  VehicleView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/7/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct VehicleView: View {

  @ObservedObject var viewModel: VehicleViewModel

  var body: some View {
    List {
      primaryInfoSection
      capacitySection
      pilotsSection
      filmsSection
    }
    .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchProperties()
    }
  }
}

extension VehicleView {

  var primaryInfoSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.name)
        Text("Model: \(viewModel.model)")
        Text("Class: \(viewModel.vehicleClass)")
        Text("Made by: \(viewModel.manufacturer)")
      }
    }
  }

  var capacitySection: some View {
    Section(header: Text("Size and Capacity")) {
      VStack(alignment: .leading, spacing: 12) {
        Text("Maximum speed: \(viewModel.maximimSpeed) kph")
        Text("Length: \(viewModel.length) m")
        Text("Crew: \(viewModel.crew)")
        Text("Passengers: \(viewModel.passengers)")
        Text("Consumables: \(viewModel.consumables)")
        Text("Cost: \(viewModel.cost) credits")
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
}

struct VehicleView_Previews: PreviewProvider {
  static let vm: VehicleViewModel = {
    let snowSpeeder = sampleVehicle("snowspeeder")
    let dataService = MockGraphDataService(dataStore: snowspeederData)
    let graphService = VehicleGraphService(
      vehicle: snowSpeeder,
      dataService: dataService
    )
    return VehicleViewModel(graphService: graphService)
  }()

  static var previews: some View {
    NavigationView {
      VehicleView(viewModel: vm)
    }
  }
}
