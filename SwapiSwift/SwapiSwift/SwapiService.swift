//
//  SwapiService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

public enum ServiceError: Error {
  case unknown
  case networkError(error: NetworkError)
  case parsingError(error: Error)
}

public protocol SwapiService {

  func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError>

  func allFilms() -> AnyPublisher<ResourceRoot<Film>, ServiceError>
  
}

public struct DataService: SwapiService {

  private let dataFetcher = DataFetcher()

  public init() { }

  public func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> {
    let config = RequestConfiguration(resource: .films)
    return swapiResource(request: Request(config: config, resourceId: resourceId))
  }

  public func allFilms() -> AnyPublisher<ResourceRoot<Film>, ServiceError> {
    let config = RequestConfiguration(resource: .films)
    return swapiResource(request: Request(config: config))
  }

  private func swapiResource<T: Decodable>(request: Request) -> AnyPublisher<T, ServiceError> {
    return dataFetcher.fetch(request.url)
      .mapError { error in
        ServiceError.networkError(error: error)
    }
    .flatMap(maxPublishers: .max(1)) { data in
      decode(data)
    }
    .eraseToAnyPublisher()
  }
}
