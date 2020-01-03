//
//  SampleData.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

var sampleFilmsList: [Film] {
  let filmsResponse: ResourceRoot<Film> = load("films")
  return filmsResponse.results
}

func load<T: SwapiResource>(_ fileName: String) -> T {
  let data: Data
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .customISO8601

  guard let resource = Bundle.main.url(forResource: fileName, withExtension: "json") else {
    fatalError("Failed to find resource url for \(fileName)")
  }

  do {
    data = try Data(contentsOf: resource)
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("There was a problem parsing the data for \(fileName): \n\(error)")
  }
}
