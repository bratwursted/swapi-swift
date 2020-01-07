//
//  Film+Strings.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

extension Film {

  private static let doubleReturnToken = "\r\n\r\n"
  private static let doubleReturnTokenWithSpace = "\r\n \r\n"
  private static let returnToken = "\r\n"
  private static let doubleReturn = "\n\n"
  private static let space = " "

  var cleanCrawlString: String {
    let graphs = openingCrawl.contains(Film.doubleReturnTokenWithSpace) ?
      openingCrawl.components(separatedBy: Film.doubleReturnTokenWithSpace) :
      openingCrawl.components(separatedBy: Film.doubleReturnToken)

    let cleanGraphs = graphs.map { return $0.replacingOccurrences(of: Film.returnToken, with: Film.space) }
    return cleanGraphs.joined(separator: Film.doubleReturn)
  }
}

extension Int {
  var romanNumeral: String {

    var value = self
    var convertedString = ""

    let numerals = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I"
    ]

    let decimals = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1
    ]

    for (index, romanCharacter) in numerals.enumerated() {
      let decimalValue = decimals[index]
      let quotient = value / decimalValue

      if quotient > 0 {
        for _ in 0..<quotient {
          convertedString += romanCharacter
          value -= quotient * decimalValue
        }
      }
    }

    return convertedString
  }
}
