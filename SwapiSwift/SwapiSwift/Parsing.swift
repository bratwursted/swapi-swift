//
//  Parsing.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

/// A free function that decodes a `Data` object to a decodable model and returns a type-erasing publisher. 
func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .iso8601

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      ServiceError.parsingError(error: error)
  }
  .eraseToAnyPublisher()
}
