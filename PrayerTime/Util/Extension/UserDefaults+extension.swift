//
//  UserDefaults+extension.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 08/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
import Adhan

extension UserDefaults {
    enum UserDefaultsKey: String {
        case geoLocation
        case locations
        case selectedLocationIndex
    }
    
    func addLocation(location: Location){
        var locations: [Location] = UserDefaults.standard.getLocations()
        if let _ = locations.firstIndex(of: location) {
            // location already exists
        } else {
            locations.append(location)
            saveLocations(list: locations)
            NotificationCenter.default.post(name: .locationUpdated, object: nil)
        }
        if getCurrentLocation() == nil, locations.count > 0 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
                self.saveCurrentIndex(index: 0)
            }
        }
    }
    func deleteLocation(location: Location){
        var locations: [Location] = UserDefaults.standard.getLocations()
        var newIndex = -1
        
        if let index = locations.firstIndex(of: location),
            let currentIndex = getCurrentIndex()  {
            
            if index == currentIndex {
                // deleting current
                if locations.count == 1 {
                    // last element
                }
                else if index == locations.count - 1 {
                    // last element
                    newIndex = locations.count - 2
                } else {
                    // else where
                }
            } else if index < currentIndex{
                // deleting before current index
                newIndex = currentIndex - 1
            } else {
                // deleting after current index
            }
            locations.removeAll {
                $0 == location
            }
            saveLocations(list: locations)
            if newIndex < locations.count {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                    self.saveCurrentIndex(index: newIndex)
                })
            }
            NotificationCenter.default.post(name: .locationUpdated, object: nil)
        }
    }
    
    func saveLocations(list: [Location]){
        let test = LocationObject(list: list)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(test) {
            set(encoded, forKey: UserDefaultsKey.locations.rawValue)
            synchronize()
        }
    }
    func getLocations() -> [Location]{
        var result: [Location] = []
        if let savedValue = object(forKey: UserDefaultsKey.locations.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let loadedObject = try? decoder.decode(LocationObject.self, from: savedValue) {
                result = loadedObject.list
            }
        }
        return result
    }
    func getCurrentIndex() -> Int?{
        var index: Int?
        if let data = value(forKey: UserDefaultsKey.selectedLocationIndex.rawValue) as? Data{
            let decriptedValue = data.decriptData()
            if Int(decriptedValue) ?? -1 >= 0{
                index = Int(decriptedValue)
            }
        }
        if getLocations().count > 0 {
            return 0
        }
        return index
    }
    func saveCurrentIndex(index: Int){
        set(String(index).encriptString(), forKey: UserDefaultsKey.selectedLocationIndex.rawValue)
        synchronize()
        NotificationCenter.default.post(name: .currentLocationChanged, object: nil)
    }
    func getCurrentLocation()->Location?{
        var location: Location?
        let locations = getLocations()
        if let index = getCurrentIndex(), index < locations.count {
            location = locations[index]
        }
        return location
    }
}
