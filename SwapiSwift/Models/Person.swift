//
//  Person.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

/// Represents metadata associated with a person in the Star Wars universe. 
public struct Person: SwapiResource, Hashable {

  /// The hair color of this person.
  public let hairColor: String

  /// An array of `Film` URL resources featuring this person.
  public let films: [String]

  /// The mass of this person in kilograms.
  public let mass: String

  /// The gender of this person (if known).
  public let gender: String

  /// The url of this resource
  public let url: String

  /// The timestamp of the last edit for this resource.
  public let edited: Date

  /// An array `Starship` URL resources that this person has piloted.
  public let starships: [String]

  /// The url of the planet resource that this person was born on.
  public let homeworld: String

  /// The timestamp of when this resource was created.
  public let created: Date

  /// The birth year of this person. BBY (Before the Battle of Yavin) or ABY (After the Battle of Yavin).
  public let birthYear: String

  /// An array of `Vehicle` URL resources that this person has piloted
  public let vehicles: [String]

  /// The url of the species resource that this person is.
  public let species: [String]

  /// The name of this person.
  public let name: String

  /// The height of this person in meters.
  public let height: String

  /// The eye color of this person.
  public let eyeColor: String

  /// The skin color of this person.
  public let skinColor: String

  enum CodingKeys: String, CodingKey {
    case hairColor = "hair_color"
    case films
    case mass
    case gender
    case url
    case edited
    case starships
    case homeworld
    case created
    case birthYear = "birth_year"
    case vehicles
    case species
    case name
    case height
    case eyeColor = "eye_color"
    case skinColor = "skin_color"
  }
}

extension Person {
  static let mockResourceUrl = "https://swapi.co/api/people/mock"

  static var mock: Person {
    Person(
      hairColor: "Mock Hair Color",
      films: [Film.mockResourceUrl],
      mass: "Mock Mass",
      gender: "Mock Gender",
      url: mockResourceUrl,
      edited: Date(),
      starships: [Starship.mockResourceUrl],
      homeworld: Planet.mockResourceUrl,
      created: Date(),
      birthYear: "Mock Birth Year",
      vehicles: [Vehicle.mockResourceUrl],
      species: [Species.mockResourceUrl],
      name: "Mock Person Name",
      height: "Mock Height",
      eyeColor: "Mock Eye Color",
      skinColor: "Mock Skin Color"
    )
  }
}
