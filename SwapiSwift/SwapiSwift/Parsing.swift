//
//  Parsing.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import Combine

extension Formatter {
  static let iso8601: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return formatter
  }()
  static let iso8601NoFs = ISO8601DateFormatter()
}

extension JSONDecoder.DateDecodingStrategy {
  static let customISO8601 = custom {
    let container = try $0.singleValueContainer()
    let string = try container.decode(String.self)
    if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601NoFs.date(from: string) {
      return date
    }
    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format \(string)")
  }
}

/// A free function that decodes a `Data` object to a decodable model and returns a type-erasing publisher. 
func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .customISO8601

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      ServiceError.parsingError(error: error)
  }
  .eraseToAnyPublisher()
}
