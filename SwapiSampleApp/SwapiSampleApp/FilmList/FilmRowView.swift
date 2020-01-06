//
//  FilmRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/6/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

final class FilmRowViewModel {

  private let film: Film

  init(film: Film) {
    self.film = film
  }

  var title: String {
    film.title
  }
}

struct FilmRowView: View {

  let viewModel: FilmRowViewModel

  var body: some View {
    Text(viewModel.title)
  }
}

struct FilmRowView_Previews: PreviewProvider {
  static var vm: FilmRowViewModel {
    let film = sampleFilms.results[0]
    return FilmRowViewModel(film: film)
  }

  static var previews: some View {
    FilmRowView(viewModel: vm)
  }
}
