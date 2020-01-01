//
//  RootResourcePage.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import Foundation

public typealias SwapiResource = Codable

/// Represents a response from the resource root endpoint containing for all resources of a type (e.g., Films or Starships).
public struct ResourceRoot<T: SwapiResource>: Codable {

  /// The count of results returned from the endpoint.
  public let count: Int

  /// The resource URL for the next page of results.
  public let next: String?

  /// The resource URL for the previous page of results.
  public let previous: String?

  /// The array of entities.
  public let results: [T]
}
