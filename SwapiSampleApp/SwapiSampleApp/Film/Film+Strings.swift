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
