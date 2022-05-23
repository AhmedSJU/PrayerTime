//
//  MainView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 15/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    @State var tag: Int = 0
    var body: some View {
        TabView(selection: $tag){
            // Prayer times
            PrayerTimeView(locationViewModel: self.locationViewModel)
                .tabItem {
                    Image(systemName: APPTabs.prayerTimes.selectedImage)
                        .font(.title)
                    Text(APPTabs.prayerTimes.title).font(.title)
            }.tag(APPTabs.prayerTimes.tag)
            
            // Manage places
            ManageLocationView(locationViewModel: self.locationViewModel)
                .tabItem {
                    Image(systemName: APPTabs.managePlaces.selectedImage)
                        .font(.title)
                    Text(APPTabs.managePlaces.title).font(.title)
            }.tag(APPTabs.managePlaces.tag)
            
            // Qibla
            QiblaView()
                .tabItem {
                    Image(systemName: APPTabs.qibla.selectedImage)
                        .font(.title)
                    Text(APPTabs.qibla.title).font(.title)
            }.tag(APPTabs.qibla.tag)
            
            // More
            MoreView()
                .tabItem {
                    Image(systemName: APPTabs.more.selectedImage)
                        .font(.title)
                    Text(APPTabs.more.title).font(.title)
            }.tag(APPTabs.more.tag)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct NoInternetView: View {
    @ObservedObject var connectivity: ConnectivityManager
    @Binding var isConnectedToInternet: Bool
    var body: some View {
        VStack{
            VStack{
                Text("Unable to stablish Internet connection. Internet connection is needed to calculate Prayer Time.")
                Button(action: {
                    //self.isConnectedToInternet = self.connectivity.isConnected
                }) {
                    Text("Retry")
                }
            }
        }
    }
}
