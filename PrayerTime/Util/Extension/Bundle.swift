//
//  Bundle.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 24/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

extension Bundle {
    
    var shortVersion: String {
        if let result = infoDictionary?["CFBundleShortVersionString"] as? String {
            return result
        } else {
            assert(false)
            return ""
        }
    }
    
    var buildVersion: String {
        if let result = infoDictionary?["CFBundleVersion"] as? String {
            return result
        } else {
            assert(false)
            return ""
        }
    }
    var appName: String {
        if let result = infoDictionary?["CFBundleName"] as? String {
            return result
        } else {
            assert(false)
            return ""
        }
    }
    var fullVersion: String {
        return "\(shortVersion)(\(buildVersion))"
    }
}
