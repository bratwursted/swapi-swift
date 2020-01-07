//
//  PlanetView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/6/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct PlanetView: View {

  @ObservedObject var viewModel: PlanetViewModel

  var body: some View {
    List {
      basicInfoSection
      terrainSection
      residentsSection
      filmsSection
    }
    .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchProperties()
    }
  }
}

extension PlanetView {
  var basicInfoSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.name)
        Text("1 day = \(viewModel.rotation)")
        Text("1 year = \(viewModel.orbit)")
        Text("Diameter: \(viewModel.diameter)")
        Text(viewModel.gravity)
        Text("Climate: \(viewModel.climate)")
        Text("Population: \(viewModel.population)")
      }
    }
  }

  var terrainSection: some View {
    Section(header: Text("Terrain")) {
      VStack(alignment: .leading, spacing: 12) {
        ForEach(viewModel.terrain, id: \.self) { terrain in
          Text(terrain)
        }
      }
    }
  }

  var residentsSection: some View {
    Section(header: Text("Residents")) {
      if viewModel.residents.isEmpty {
        Text("No results")
      } else {
        ForEach(viewModel.residents, id: \.self) { resident in
          self.viewModel.rowView(for: resident)
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
          self.viewModel.rowView(for: film)
        }
      }
    }
  }
}

struct PlanetView_Previews: PreviewProvider {
  static let vm: PlanetViewModel = {
    let planet = samplePlanets.results[0]
    let dataService = MockGraphDataService(dataStore: alderaanData)
    let service = PlanetGraphService(planet: planet, dataService: dataService)
    return PlanetViewModel(graphService: service)
  }()
  
  static var previews: some View {
    NavigationView {
      PlanetView(viewModel: vm)
    }
  }
}
