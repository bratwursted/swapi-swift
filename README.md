# SwapiSwift
A Swift framework for interacting with the Star Wars API ([SWAPI](http://swapi.co/)). The framework includes data models for all resources provided by the API (e.g., films, people, planets, starships, and vehicles) as well as networking components and parsing to make requesting resources as simple as importing the framework.

`SwapiSwift` requires iOS 13+ and is built using Apple's [Combine framework](https://developer.apple.com/documentation/combine), making it suitable for SwiftUI projects.

## Installation

You can install `SwapiSwift` manually or using Carthage.

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a simple dependency management system. To integrate `SwapiSwift`, specify the following in your project's Cartfile:

```
github "bratwursted/swapi-swift"
```

You can read more about installing Carthage locally at their repo.

#### Manually

If you prefer, you can include `SwapiSwift` manually as a submodule or just by copying the files to your project.

##### As a submodule

- Be sure your project directory is initialized as a git repository:
```
$ git init
```

- Add the repo as a submodule:
```Terminal
$ git submodule add https://github.com/bratwursted/swapi-swift
```

- Open the `SwapiSwift` directory and drag the `SwapiSwift.xcodeproj` file into the project navigator of your Xcode project. It should be nested under the main project project icon of your project.

- Verify the deployment target of your project application matches the target of `SwapiSwift.xcodeproj`.  

- Select the application target of your project and open the "General" tab. In the "Embedded Binaries" section, click the `+` button and select the `SwapiSwift.xcodeproj` to add the framework to your Xcocde project.

### Use

The repo includes an example app to demonstrate how to incorporate `SwapiSwift` into a app. The primary components that are of interest are:

- `SwapiService` defines a protocol with methods for requesting resources from the Star Wars API. `DataService` is a concrete implementation of the protocol, or you can create your own. `MockDataService` is an implementation that can be used to mock data for use in SwiftUI previews and unit tests.

- `GraphService` defines a protocol for helper classes that fill out the object graph for resources such as films, people and planets. `MockGraphDataService` is an implementation conforming to `SwapiService` that can be used to supply mock data for SwiftUI previews and unit tests.

### API Files

For users of [Paw](https://paw.cloud), an API tool for Macs, the repo includes a `.paw` file so you can interact with the Star Wars API and inspect the API responses. There is also a `swapi.json` file that can be imported into [Postman](https://www.getpostman.com). 

### Questions and Feature Requests

If you run into problems, find bugs, or would like to request a new feature, feel free to [open an issue](https://github.com/bratwursted/swapi-swift/issues). If you'd like to contribute, put up a [pull request](https://github.com/bratwursted/swapi-swift/pulls) :tada:.

### Credits

The Star Wars API is an [open source project](https://github.com/phalt/swapi) from [Paul Hallett](https://github.com/phalt).
