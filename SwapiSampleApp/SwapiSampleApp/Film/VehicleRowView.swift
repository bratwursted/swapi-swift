//
//  VehicleRowView.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/4/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import Foundation
import SwiftUI
import SwapiSwift

final class VehicleRowViewModel {

  private let vehicle: Vehicle

  init(vehicle: Vehicle) {
    self.vehicle = vehicle
  }

  var name: String {
    vehicle.name
  }
}

struct VehicleRowView: View {

  let viewModel: VehicleRowViewModel

  var body: some View {
    Text(viewModel.name)
  }
}
