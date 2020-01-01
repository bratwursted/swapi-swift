import UIKit
import SwapiSwift
import Combine

var str = "Hello, playground"

let service = DataService()

let disposables = Set<AnyCancellable>()

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
}

service.allFilms()
  .map { response in
    response.results
}
.receive(on: DispatchQueue.main)
.sink(receiveCompletion: { completion in
  switch completion {
  case .finished:
    break
  case .failure(let error):
    print("There was an error \(error)")
  }
}) { films in
  print("received \(films.count) films")
}
