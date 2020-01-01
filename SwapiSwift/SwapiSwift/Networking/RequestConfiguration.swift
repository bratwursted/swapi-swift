//
//  RequestConfiguration.swift
//  SwapiSwift
//
//  Created by Joe Bramhall on 1/1/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation

struct RequestConfiguration {

  enum Resource: String {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
  }

  private let scheme = "https"
  private let host = "swapi.co"
  private let path = "/api"
  private let resource: Resource?

  private var components: URLComponents {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    return components
  }

  private var baseApiUrl: URL? {
    var baseComponents = components
    baseComponents.path = path + "/"
    return baseComponents.url
  }

  var resourceRootUrl: URL? {
    guard let resourceRoot = resource?.rawValue else { return baseApiUrl }
    var resourceComponents = components
    let rootPath = path.urlPath(withComponents: [resourceRoot])
    resourceComponents.path = rootPath
    return resourceComponents.url
  }

  func resourceUrl(resourceId: String) -> URL? {
    guard let resourceRoot = resource?.rawValue else { return nil }

    var resourceComponents = components
    let resourcePath = path.urlPath(withComponents: [resourceRoot, resourceId])
    resourceComponents.path = resourcePath
    return resourceComponents.url
  }

  init(resource: Resource? = nil) {
    self.resource = resource
  }
}

private extension String {
  func urlPath(withComponents pathComponents: [String]) -> String {
    (self as NSString).appendingPathComponent(pathComponents.joined(separator: "/")) + "/"
  }
}
