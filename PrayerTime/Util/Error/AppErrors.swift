//
//  AppErrors.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 13/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import Foundation
enum APPErrors: Error{
    case failedToGetLocationData
    case failedToGetTimeZone
    case failedToGetCalenderInfo
    case failedToCalculateForSelectedLocation
    case other(message: String)
    var localizedDescription: String{
        switch self{
        default: return "\(self)"
        }
    }
}
