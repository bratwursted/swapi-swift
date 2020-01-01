//
//  SwapiService.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

enum ServiceError: Error {
  case unknown
  case networkError(error: NetworkError)
  case parsingError(error: Error)
}

protocol SwapiService {

  func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> 
  
}

struct DataService: SwapiService {

  private let dataFetcher = DataFetcher()

  func film(withId resourceId: String) -> AnyPublisher<Film, ServiceError> {
    let config = RequestConfiguration(resource: .films)
    return swapiResource(request: Request(config: config, resourceId: resourceId))
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