//
//  Int+extension.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 26/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

extension Int{
    func getMonthName(calendarType: CalendarType)->String?{
        var monthName: String?
        if self >= 0 && self < 12 {
            let dateFormatter = DateFormatter()
            switch calendarType{
            case .gregorian:
                dateFormatter.calendar = .init(identifier: .gregorian)
            case .hijri:
                dateFormatter.calendar = .init(identifier: .islamicUmmAlQura)
            }
            monthName = dateFormatter.monthSymbols[self]
        }
        return monthName
    }
}
