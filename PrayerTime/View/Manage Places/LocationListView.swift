//
//  LocationListView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 27/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(locationViewModel.locations, id: \.self){ item in
                        Text("\(item.cityName), \(item.countryName)")
                    }.onDelete { (indexSet) in
                        //self.savedLocations.removeLocation(indexSet: indexSet)
                    }
                }
            }.navigationBarTitle("Manage Locations", displayMode: .inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: AddLocationView(),
                                   label: {
                                    Text("+")
                                        .frame(width: 30, height: 30)
                                        .font(.largeTitle)
                    })
            )
        }
        .onAppear{
            UITableView.appearance().tableFooterView = UIView()
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
}
