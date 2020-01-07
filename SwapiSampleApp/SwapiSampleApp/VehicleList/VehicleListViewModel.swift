//
//  VehicleListViewModel.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwapiSwift

final class VehicleListViewModel {

  let vehicles: [Vehicle]

  init(vehicles: [Vehicle]) {
    self.vehicles = vehicles
  }

  func rowView(for vehicle: Vehicle) -> VehicleRowView {
    VehicleRowView(viewModel: VehicleRowViewModel(vehicle: vehicle))
  }

  func destinationView(forVehicle vehicle: Vehicle) -> VehicleView {
    let graphService = VehicleGraphService(vehicle: vehicle)
    let vm = VehicleViewModel(graphService: graphService)
    return VehicleView(viewModel: vm)
  }

  var viewTitle: String {
    "Vehicles"
  }
}
