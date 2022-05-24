//
//  GlobalURLs.swift
//  PrayerTime
//
//  Created by Jamal on 24/05/2022.
//  Copyright © 2022 Sheikh Ahmed. All rights reserved.
//

import Foundation

public enum GlobalConstants: String {
    case production
}

extension GlobalConstants {
    static let GeoNameAPILink: String = {
        return "http://api.geonames.org"
    }()

    static let GeoUserName: String = {
        return "jerinapp"
    }()
}

enum CalculationState: String {
    case isCalculating
    case finishedCalculating
    case unknown
    case finishedWithError
}
