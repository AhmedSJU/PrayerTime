//
//  MoreViewModel.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 22/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

class MoreViewModel: ObservableObject {
    @Published var moreMenuList: MoreList = MoreList()
    init(){
        let aboutMyApp = MoreListSection(title: .about)
        self.moreMenuList.section = [aboutMyApp]
    }
}
