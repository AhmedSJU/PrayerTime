//
//  NotificationCenter+extention.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 08/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
enum NotificationNames: String {
    case currentLocationChanged
    case locationUpdated
}
extension Notification.Name {
    static let currentLocationChanged = Notification.Name(NotificationNames.currentLocationChanged.rawValue)
    static let locationUpdated = Notification.Name(NotificationNames.locationUpdated.rawValue)
}
