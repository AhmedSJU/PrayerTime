//
//  LocationNavigationView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 28/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct LocationNavigationView: View {
    @ObservedObject var locationViewModel:  LocationViewModel
    var body: some View {
        HStack{
            if locationViewModel.currentLocationIndex > 0 {
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.locationViewModel.loadPreviousLocation()
                }
            }
            Spacer()
            if locationViewModel.currentLocationIndex < locationViewModel.locations.count - 1 {
                Image(systemName: "chevron.right.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.locationViewModel.loadNextLocation()
                }
            }
        }
    }
}
