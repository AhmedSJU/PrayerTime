//
//  TimeZoneView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct TimeZoneView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    @State var errorMessage: String?
    var body: some View {
        VStack{
            if locationViewModel.currentLocation == nil {
                Text("Unable to load current location. Please try again.")
            }
            else {
                Text("\(locationViewModel.currentLocation!.cityName), \(locationViewModel.currentLocation!.countryName)")
                    .font(.headline)
                Text("(Lat: \(String(locationViewModel.currentLocation!.latitude).showFirstFourDigits()), Lon: \(String(locationViewModel.currentLocation!.longitude).showFirstFourDigits()))")
                    .font(.caption)
                    .fontWeight(.light)
                HStack{
                    if self.errorMessage != nil {
                        Text(self.errorMessage!)
                    } else {
                        Text("\(locationViewModel.gregorianTime.toNarrativeDate(calendarType: .gregorian))")
                            .fontWeight(.semibold)
                            .font(.caption)
                        Spacer()
                        Text("\(locationViewModel.weekDay)")
                            .fontWeight(.bold)
                            .font(.caption)
                        Spacer()
                        Text("\(locationViewModel.hijriTime)")
                        .fontWeight(.semibold)
                            .font(.caption)
                    }
                }.padding(.top, 5)
                
                
            }
        }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 1)
        )
    }
}
