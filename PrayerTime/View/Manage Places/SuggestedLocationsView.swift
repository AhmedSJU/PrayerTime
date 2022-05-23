//
//  SuggestedLocationsView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 27/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct SuggestedLocationsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var addLocationViewModel: AddLocationViewModel
    @State var shouldShowError: Bool = false
    var body: some View {
        if addLocationViewModel.errorMessage != nil {
            return AnyView(ErrorView(error: addLocationViewModel.errorMessage))
        } else {
            return AnyView(
                List {
                    ForEach(addLocationViewModel.list, id: \.self){ item in
                        Text("\(item.name ?? ""), \(item.countryName ?? "") ")
                            .onTapGesture
                            {
                                if let cityName = item.name,
                                    let countryName = item.countryName,
                                    let lat = item.lat, let latitude = Double(lat),
                                    let lng = item.lng, let longitude = Double(lng) {
                                    var location = Location()
                                    location.cityName = cityName
                                    location.countryName = countryName
                                    location.latitude = latitude
                                    location.longitude = longitude
                                    UserDefaults.standard.addLocation(location: location)
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                else {
                                    self.shouldShowError.toggle()
                                }
                        }
                    }
                }
            )
        }
    }
}
