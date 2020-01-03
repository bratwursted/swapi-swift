import UIKit
import SwapiSwift
import Combine

var str = "Hello, playground"

let service = DataService()

var disposables = Set<AnyCancellable>()

func characters(from film: Film) {
  let service = FilmGraphService(film: film)
  service.fetchAssociatedProperties()

  service
    .$characters
    .sink(receiveCompletion: { completion in
      switch completion {
      case .failure:
        print("something went wrong")
      case .finished:
        break
      }
    }, receiveValue: { characters in
      print("the film has \(characters.count) characters")
      characters.forEach { print("\($0.name)") }
    })
  .store(in: &disposables)
}


service.film(withId: "1")
  .receive(on: DispatchQueue.main)
  .sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
      break
    case .failure(let error):
      print("there was an error \(error)")
    }
  }) { film in
    print("got the film titled \"\(film.title)\"")
    characters(from: film)
}

//service.allFilms()
//  .map { response in
//    response.results
//}
//.receive(on: DispatchQueue.main)
//.sink(receiveCompletion: { completion in
//  switch completion {
//  case .finished:
//    break
//  case .failure(let error):
//    print("There was an error \(error)")
//  }
//}) { films in
//  print("received \(films.count) films")
//}

