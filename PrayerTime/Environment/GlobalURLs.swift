//
//  GlobalURLs.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 09/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI
import Adhan
import Combine
import CoreLocation

public enum GlobalConstants: String {
    case production
}

extension GlobalConstants {
    static let GeoNameAPILink: String = {
        return "http://api.geonames.org"
    }()
    static let GeoUserName: String = {
        return "jerintel"
    }()
}

enum CalculationState: String{
    case isCalculating
    case finishedCalculating
    case unknown
    case finishedWithError
}
