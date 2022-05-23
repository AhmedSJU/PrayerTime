//
//  Tab.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 08/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
// MARK:- All tabs in the APP
enum APPTabs: String{
    case prayerTimes
    case managePlaces
   // case alQuran
    case qibla
    case more
    var title: String {
        return self.rawValue.titleCase()
    }
    var selectedImage: String {
        switch self {
        case .prayerTimes: return "clock.fill"
        case .managePlaces: return "square.and.pencil"
     //   case .alQuran: return "book.fill"
        case .qibla: return "location.fill"
        case .more: return "circle.grid.2x2.fill"
        }
    }
    var tag: Int{
        switch self {
        case .prayerTimes: return 0
        case .managePlaces: return 1
   //     case .alQuran: return 2
        case .qibla: return 3
        case .more: return 4
        }
    }
}


