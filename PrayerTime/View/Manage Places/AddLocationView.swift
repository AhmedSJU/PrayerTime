//
//  AddLocationsView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 27/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI
import Combine

struct AddLocationView: View {
    @ObservedObject var addLocationViewModel: AddLocationViewModel = AddLocationViewModel()
    var body: some View {
        VStack{
            HStack{
                LocationSearchView(locationViewModel: addLocationViewModel)
                GeoLocationView()
            }
            if addLocationViewModel.errorMessage == nil {
                SuggestedLocationsView(addLocationViewModel: addLocationViewModel)
            } else {
                ErrorView(error: addLocationViewModel.errorMessage)
            }
            Spacer()
        }.padding()
            .onAppear{
                self.addLocationViewModel.list = []
        }
    }
}
