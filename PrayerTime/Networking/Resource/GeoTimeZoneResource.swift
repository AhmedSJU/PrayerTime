//
//  GeoNameResource.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI



// for determining Time Zone
struct GeoTimeZoneResource{
    var latitude: Double
    var longitude: Double
    var userName: String
}

extension GeoTimeZoneResource: ResourceType{
    var baseURL: URL {
        guard let url = URL(string: GlobalConstants.GeoNameAPILink) else { fatalError("baseURL could not be configured.") }
        return url
    }
    var path: String {
        return "/timezoneJSON"
    }
    var parameter: Parameters {
        var param = [String: String]()
        param["lat"] = "\(latitude)"
        param["lng"] = "\(longitude)"
        param["username"] = userName
        return param
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding , urlParameters: parameter, additionHeaders: nil)
    }
}


// for Auto location Name
struct GeoLocationResource{
    var locationName: String
    var userName: String
    var numberOfResults: Int
}

extension GeoLocationResource: ResourceType{
    var baseURL: URL {
        guard let url = URL(string: GlobalConstants.GeoNameAPILink) else { fatalError("baseURL could not be configured.") }
        return url
    }
    var path: String {
        return "/searchJSON"
    }
    var parameter: Parameters {
        var param = [String: String]()
        param["q"] = "\(locationName)"
        param["maxRows"] = "\(numberOfResults)"
        param["username"] = userName
        return param
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding , urlParameters: parameter, additionHeaders: nil)
    }
}

// for Reverse Geo location Name
struct ReverseGeoLocationResource{
    var latitude: Double
    var longitude: Double
    var userName: String
}

extension ReverseGeoLocationResource: ResourceType{
    var baseURL: URL {
        guard let url = URL(string: GlobalConstants.GeoNameAPILink) else { fatalError("baseURL could not be configured.") }
        return url
    }
    var path: String {
        return "/findNearbyJSON"
    }
    var parameter: Parameters {
        var param = [String: String]()
        param["lat"] = "\(latitude)"
        param["lng"] = "\(longitude)"
        param["username"] = userName
        return param
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var task: HTTPTask {
        return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding , urlParameters: parameter, additionHeaders: nil)
    }
}
