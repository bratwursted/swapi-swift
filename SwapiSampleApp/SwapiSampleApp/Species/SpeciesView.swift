//
//  SpeciesView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/6/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct SpeciesView: View {

  @ObservedObject var viewModel: SpeciesViewModel

  var body: some View {
    List {
      infoSection
      skinSection
      eyesSection
      hairSection
      homeworldSection
      peopleSection
      filmsSection
    }
    .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    .onAppear {
      self.viewModel.fetchProperties()
    }
  }
}

extension SpeciesView {

  var infoSection: some View {
    Section {
      VStack(alignment: .leading, spacing: 12) {
        Text(viewModel.name)
        Text("Designation: \(viewModel.designation)")
        Text("Classification: \(viewModel.classification)")
        Text("Avg. height: \(viewModel.height)")
        Text("Avg. lifespan: \(viewModel.lifespan) yrs")
        Text("Language: \(viewModel.language)")
      }
    }
  }

  var skinSection: some View {
    Section(header: Text("Skin colors")) {
      VStack(alignment: .leading, spacing: 12) {
        ForEach(viewModel.skinColors, id: \.self) { color in
          Text(color)
        }
      }
    }
  }

  var hairSection: some View {
    Section(header: Text("Hair colors")) {
      VStack(alignment: .leading, spacing: 12) {
        ForEach(viewModel.hairColors, id: \.self) { color in
          Text(color)
        }
      }
    }
  }

  var eyesSection: some View {
    Section(header: Text("Eye colors")) {
      VStack(alignment: .leading, spacing: 12) {
        ForEach(viewModel.eyeColors, id: \.self) { color in
          Text(color)
        }
      }
    }
  }

  var homeworldSection: some View {
    Section(header: Text("Home world")) {
      if viewModel.homeworld == nil {
        Text("No results")
      } else {
        Text(viewModel.homePlanet)
      }
    }
  }

  var peopleSection: some View {
    Section(header: Text("People")) {
      if viewModel.people.isEmpty {
        Text("No results")
      } else {
        ForEach(viewModel.people, id: \.self) { person in
          self.viewModel.rowView(for: person)
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

struct SpeciesView_Previews: PreviewProvider {
  static let vm: SpeciesViewModel = {
    let species = sampleSpecies("hutt")
    let planet = samplePlanet("nal-hutta")
    let dataService = MockGraphDataService(
      dataStore: huttData,
      homeworld: planet
    )
    let graphService = SpeciesGraphService(
      species: species,
      dataService: dataService
    )
    return SpeciesViewModel(graphService: graphService)
  }()

  static var previews: some View {
    NavigationView {
      SpeciesView(viewModel: vm)
    }
  }
}
