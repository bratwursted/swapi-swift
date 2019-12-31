//
//  FilmsTests.swift
//  SwapiSwiftTests
//
//  Created by Joe Bramhall on 12/31/19.
//  Copyright © 2019 thinx. All rights reserved.
//

import XCTest
@testable import SwapiSwift

class FilmsTests: XCTestCase {

  var sut: RootResourcePage<Film>?

  override func setUp() {
    sut = sampleFilms
  }

  override func tearDown() {
    sut = nil
  }

  func testFilmsResource() {

    XCTAssertEqual(sut?.count, 7)
    XCTAssertNil(sut?.next)
    XCTAssertNil(sut?.previous)
    XCTAssertEqual(sut?.results.count, 7)

    XCTAssertEqual(sut?.results[0].title, "A New Hope")
    XCTAssertEqual(sut?.results[1].title, "Attack of the Clones")
    XCTAssertEqual(sut?.results[2].title, "The Phantom Menace")
    XCTAssertEqual(sut?.results[3].title, "Revenge of the Sith")
    XCTAssertEqual(sut?.results[4].title, "Return of the Jedi")
    XCTAssertEqual(sut?.results[5].title, "The Empire Strikes Back")
    XCTAssertEqual(sut?.results[6].title, "The Force Awakens")
  }

}
