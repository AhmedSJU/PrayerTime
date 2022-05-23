//
//  LocationListViewModel.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 28/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

class AddLocationViewModel: ObservableObject {
    @State var connectivityManager = ConnectivityManager()
    @Published var list: [Geoname] = []
    @Published var errorMessage: String?
    
    // load list through API Call
    func getList(forLocation: String, numberOfResults: Int) {
        let service = GeoNameService()
        if connectivityManager.monitor?.currentPath.status == .satisfied {
            service.getLocations(searchString: forLocation, numberOfResults: numberOfResults) { (result) in
                switch result {
                case .success(let model):
                    if let model = model, let results = model.geonames{
                        let refinedList = results.filter {
                            !($0.name?.isEmpty ?? true) && !($0.countryName?.isEmpty ?? true)
                        }
                        self.list = refinedList
                        self.errorMessage = nil
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
        else {
            DispatchQueue.main.async {
                self.errorMessage = "Your device is not connected to Internet. To add a location, Internet connection is necessary."
            }
        }
    }
}
