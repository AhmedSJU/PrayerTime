//
//  GeoNameService.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

protocol GeoNameServiceType: class {
    func getTimeZone(latitude: Double, longitude: Double, completion: @escaping(Result<TimeZoneModel?,APIError>)-> Void)
    func getLocations(searchString: String, numberOfResults: Int, completion: @escaping (Result<SuggestedLocationModel?, APIError>) -> Void)
    func getGeoLocation(latitude: Double, longitude: Double, completion: @escaping(Result<SuggestedLocationModel?,APIError>)-> Void)
}

class GeoNameService: GeoNameServiceType{
    
    
    var requestManager: RequestManagerType = RequestManager()
    
    func getTimeZone(latitude: Double, longitude: Double, completion: @escaping (Result<TimeZoneModel?, APIError>) -> Void) {
        let resource = GeoTimeZoneResource(latitude: latitude, longitude: longitude, userName: GlobalConstants.GeoUserName)
        
        guard let request = try? resource.makeRequest() else { return }
       // print(request.url)
        
        requestManager.fetch(with: request, decode: {
            json -> TimeZoneModel? in
            
            guard let model = json as? TimeZoneModel else { return nil }
            
            return model
        }, completion: completion)
    }
    
    func getLocations(searchString: String, numberOfResults: Int, completion: @escaping (Result<SuggestedLocationModel?, APIError>) -> Void) {
        let resource = GeoLocationResource(locationName: searchString, userName: GlobalConstants.GeoUserName, numberOfResults: numberOfResults)
        
        guard let request = try? resource.makeRequest() else {return}
      //  print(request.url)
        
        requestManager.fetch(with: request, decode: {
            json -> SuggestedLocationModel? in
            guard let model = json as? SuggestedLocationModel else { return nil}
            return model
        }, completion: completion)
    }
    
    func getGeoLocation(latitude: Double, longitude: Double, completion: @escaping (Result<SuggestedLocationModel?, APIError>) -> Void) {
        let resource = ReverseGeoLocationResource(latitude: latitude, longitude: longitude, userName: GlobalConstants.GeoUserName)
        
        guard let request = try? resource.makeRequest() else {return}
      //  print(request.url)
        
        requestManager.fetch(with: request, decode: {
            json -> SuggestedLocationModel? in
            guard let model = json as? SuggestedLocationModel else { return nil}
            return model
        }, completion: completion)
        
    }
}
