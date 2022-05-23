//
//  Location.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 14/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import Foundation
struct Location: Hashable, Codable{
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.cityName == rhs.cityName && lhs.countryName == rhs.countryName
    }
    var cityName: String = ""
    var countryName: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
}

struct LocationObject: Codable{
    var list: [Location]
}

enum PrayerType: String, Codable{
    case fajr
    case sunrise
    case duhr
    case asr
    case maghrib
    case isha
    case unknown
}
struct PrayerTime: Hashable, Codable{
    var prayerType: PrayerType = .unknown
    var time: String = ""
    var notification: Bool = false
}
