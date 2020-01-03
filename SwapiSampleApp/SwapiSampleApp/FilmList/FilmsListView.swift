//
//  FilmsListView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import Combine
import SwapiSwift

struct FilmsListView: View {

  @ObservedObject var viewModel: FilmsListViewModel

  var body: some View {
    NavigationView {
      List {
        if viewModel.films.isEmpty {
          emptySection
        } else {
          resultsSection
        }
      }
      .navigationBarTitle("Star Wars")
      .onAppear {
        self.viewModel.loadFilms()
      }
    }
  }

  var emptySection: some View {
    Section {
      Text("No films found")
    }
  }

  var resultsSection: some View {
    Section {
      ForEach(viewModel.films, content: FilmResultView.init(viewModel:))
    }
  }
}

struct FilmsListView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = FilmsListViewModel(dataService: MockDataService(mockData: sampleFilms))
    return FilmsListView(viewModel: viewModel)
  }
}
