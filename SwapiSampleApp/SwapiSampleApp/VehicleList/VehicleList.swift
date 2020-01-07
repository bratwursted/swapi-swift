//
//  VehicleList.swift
//  SwapiSampleApp
//
//  Created by Joe Bramhall on 1/5/20.
//  Copyright © 2020 thinx. All rights reserved.
//

import SwiftUI
import SwapiSwift

struct VehicleList: View {

  let viewModel: VehicleListViewModel

  var body: some View {
    List {
      ForEach(viewModel.vehicles, id: \.self) { vehicle in
        NavigationLink(
          destination: self.viewModel.destinationView(forVehicle: vehicle)
        ) {
          self.viewModel.rowView(for: vehicle)
        }
      }
    }
    .navigationBarTitle(Text(viewModel.viewTitle), displayMode: .inline)
  }
}

struct VehicleList_Previews: PreviewProvider {
  static var previews: some View {
    VehicleList(viewModel: VehicleListViewModel(
      vehicles: newHopeData[.vehicles] as! [Vehicle]
    ))
  }
}
