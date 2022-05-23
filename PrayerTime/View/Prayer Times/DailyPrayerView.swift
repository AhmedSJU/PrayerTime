//
//  DailyPrayerView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct DailyPrayerView: View {
    @ObservedObject var connectivity: ConnectivityManager = ConnectivityManager()
    @ObservedObject var locationViewModel: LocationViewModel
    private var location: String? {
        if let currentLocation = self.locationViewModel.currentLocation {
            return "City: \(currentLocation.cityName),\nCountry: \(currentLocation.countryName),\nlatitude: \(currentLocation.latitude),\nlongitude: \(currentLocation.longitude)"
        } else {
            return "unknown location"
        }
    }
    var body: some View {
        VStack{
            if self.connectivity.monitor?.currentPath.status != .satisfied {
                 Text("Unable to stablish Internet connection. Internet connection is needed to calculate Prayer Time.")
            }
            else if locationViewModel.isCalculating == CalculationState.isCalculating {
                VStack{
                    ActivityIndicatorView(isAnimating: true)
                }
            }
            else if locationViewModel.isCalculating == CalculationState.finishedWithError {
                VStack{
                    Group {
                        Text("Calculate for the current location failed. Please share the location info with us, our developer will try to fix it.")
                            .fontWeight(.semibold)
                        Text(self.location ?? "")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }.font(.footnote)
                        .padding()
                }
            }
            else if locationViewModel.isCalculating == CalculationState.unknown {
                VStack{
                    Group {
                        Text("Something went wrong. Please share the location info with us, our developer will try to fix it.")
                            .fontWeight(.semibold)
                        Text(self.location ?? "")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }.font(.footnote)
                        .padding()
                }
            }
            else if locationViewModel.isCalculating == CalculationState.finishedCalculating {
                VStack(spacing: 5){
                    // Fajr
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .fajr)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    // Sunrise
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .sunrise)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    // Duhr
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .duhr)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    // Asr
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .asr)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    // Maghrib
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .maghrib)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                    
                    // Isha
                    SinglePrayerTimeView(locationViewModel: self.locationViewModel, prayerName: .isha)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                }
            }
            else {
                ErrorView(error: "Unknown error....")
            }
        }
    }
}

struct SinglePrayerTimeView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    @State var prayerName: PrayerNames
    var body: some View {
        HStack{
            Image(systemName: prayerName.image)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(prayerName.imageColor)
            Text(prayerName.rawValue.titleCase())
            Spacer()
            if prayerName == .fajr {
                Text(locationViewModel.fajrTime)
            } else if prayerName == .sunrise {
                Text(locationViewModel.sunriseTime)
            } else if prayerName == .duhr {
                Text(locationViewModel.duhrTime)
            } else if prayerName == .asr {
                Text(locationViewModel.asrTime)
            } else if prayerName == .maghrib {
                Text(locationViewModel.maghribTime)
            } else if prayerName == .isha {
                Text(locationViewModel.ishaTime)
            } else {
                EmptyView()
            }
        }
    }
}
