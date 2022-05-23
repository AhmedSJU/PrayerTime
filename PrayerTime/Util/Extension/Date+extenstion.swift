//
//  Date+extenstion.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 07/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
extension Date{
    func goergianDate()->String{
        let calender = Calendar.current
        let day = calender.component(.day, from: self)
        let month = self.georgianMonth()
        let year = calender.component(.year, from: self)
        return "\(day) \(month), \(year)"
    }
    func hijriDate()->String{
        let calender = Calendar.init(identifier: .islamicCivil)
        let day = calender.component(.day, from: self)
        let month = self.arabianMonth()
        let year = calender.component(.year, from: self)
        return "\(day) \(month), \(year)"
    }
    func georgianMonth()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        return dateFormatter.string(from: self)
    }
    func arabianMonth()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .init(identifier: .islamicCivil)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        return dateFormatter.string(from: self)
    }
    func weekDay()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        return dateFormatter.string(from: self)
    }
    func convertToLocalTime(fromTimeZone timeZoneAbbreviation: String) -> Date? {
        if let timeZone = TimeZone(abbreviation: timeZoneAbbreviation) {
            let targetOffset = TimeInterval(timeZone.secondsFromGMT(for: self))
            let localOffeset = TimeInterval(TimeZone.autoupdatingCurrent.secondsFromGMT(for: self))
            
            return self.addingTimeInterval(targetOffset - localOffeset)
        }
        return nil
    }
    func getYear()->String{
        let date = Date()
        let calender = Calendar.current
        return "\(calender.component(.year, from: date))"
    }
}

extension Date {
   struct Formatter {
       static let utcFormatter: DateFormatter = {
           let dateFormatter = DateFormatter()
 
           dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss'Z'"
           dateFormatter.timeZone = TimeZone(identifier: "GMT")
 
           return dateFormatter
       }()
   }
 
   var dateToUTC: String {
       return Formatter.utcFormatter.string(from: self)
   }
}
 
