//
//  PersonGraphService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/3/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation

final class PersonGraphService: GraphService {

  let person: Person

  // Associated properties

  @Published var films: [Film] = []

  @Published var starships: [Starship] = []

  @Published var vehicles: [Vehicle] = []

  @Published var species: [Species] = []

  @Published var homeworld: Planet?

  private var dataService: SwapiService

  init(
    person: Person,
    dataService: SwapiService = DataService()) {
    self.person = person
    self.dataService = dataService
  }

  func fetchAssociatedProperties() {
    // get homeworld

    
  }
}
