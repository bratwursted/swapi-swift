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

  @ObservedObject var viewModel: PersonViewModel

  var body: some View {
    List {
      personalSection
      homeSection
      vitalsSection
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
}

struct PersonView_Previews: PreviewProvider {
  static let vm = PersonViewModel(graphService: PersonGraphService(person: samplePeople.results[0], dataService: MockGraphDataService(dataStore: lukeData, homeworld: samplePlanet("Tatooine"))))

  static var previews: some View {
    NavigationView {
      PersonView(viewModel: vm)
    }
  }
}
