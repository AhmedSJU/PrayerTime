//
//  Location.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 07/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
import Adhan

enum PrayerNames: String{
    case fajr
    case sunrise
    case duhr
    case asr
    case maghrib
    case isha
    var image: String{
        switch self{
        case .fajr: return "sparkles"
        case .sunrise: return "sunrise.fill"
        case .duhr: return "sun.max.fill"
        case .asr: return "cloud.sun.fill"
        case .maghrib: return "sunset.fill"
        case .isha: return "moon.stars.fill"
        }
    }
    var imageColor: Color{
        switch self{
        case .fajr, .isha: return .blue
        default: return .yellow
        }
    }
}
struct Coordinates: Codable{
    let latitude: Double
    let longitude: Double
}

struct SavedLocationObject: Codable{
    var locationList: [SavedLocation]
}
struct SavedLocation: Codable, Identifiable, Hashable{
    var id = UUID()
    var cityName = ""
    var countryName = ""
    var latitude = ""
    var longitude = ""
    var notificationSettings: [Bool] = [
        false, false, false, false, false, false
    ]
    var calculationMethod: CalculationMethod = .moonsightingCommittee
}
