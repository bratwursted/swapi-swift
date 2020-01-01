//
//  Request.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation

struct Request {

  var url: URL? {

    if let resourceId = resourceId {
      return config?.resourceUrl(resourceId: resourceId)
    }

    return config?.resourceRootUrl ?? resourceUrl.flatMap { URL(string: $0) }
  }

  private var resourceUrl: String?

  private var resourceId: String?

  private let config: RequestConfiguration?

  init(
    config: RequestConfiguration? = nil,
    resourceId: String? = nil,
    resourceUrl: String? = nil
  ) {
    self.config = config
    self.resourceId = resourceId
    self.resourceUrl = resourceUrl
  }
}
