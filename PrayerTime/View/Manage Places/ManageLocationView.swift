//
//  ManageLocationView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 15/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct ManageLocationView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(locationViewModel.locations, id: \.self){ item in
                        Text("\(item.cityName), \(item.countryName)")
                    }.onDelete { (indexSet) in
                        let locations: [Location] = UserDefaults.standard.getLocations()
                        if let index = indexSet.sorted().first, index < locations.count {
                            UserDefaults.standard.deleteLocation(location: locations[index])
                        }
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
            NotificationCenter.default.addObserver(forName: .locationUpdated, object: nil, queue: .main) { (_) in
                self.reloadLocations()
            }
        }
    .navigationViewStyle(StackNavigationViewStyle())
    }
    private func reloadLocations(){
        self.locationViewModel.reloadLocations()
    }
}

struct ManageLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ManageLocationView(locationViewModel: LocationViewModel())
    }
}
