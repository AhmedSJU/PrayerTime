//
//  PrayerTimeView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct PrayerTimeView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    var body: some View {
        ZStack{
            BackGroundView()
            if locationViewModel.locations.count == 0 {
                Text( "No saved locations found. Please add location through Manage Locations tab.")
                    .fontWeight(.semibold)
                    .padding()
            }
            else {
                VStack{
                    VStack{
                        TimeZoneView(locationViewModel: self.locationViewModel)
                        DailyPrayerView(locationViewModel: self.locationViewModel)
                        LocationNavigationView(locationViewModel: self.locationViewModel)
                        Spacer()
                    }
                    
                }.padding()
            }
        }
    }
    
}

struct PrayerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
