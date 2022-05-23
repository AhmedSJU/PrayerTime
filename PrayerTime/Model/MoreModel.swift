//
//  MoreModel.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 22/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI
// MARK:- More List for more tab
struct MoreList: Identifiable{
    var id = UUID()
    var title: String = ""
    var section: [MoreListSection] = []
}
// MARK:- More List Section
struct MoreListSection: Identifiable{
    var id = UUID()
    var title: MoreListSectionType
    var rows: [MoreListRow] {
        switch title{
        case .about:
            return [
                .init(title: .theApp, targetView: AnyView(About())),
                .init(title: .appVersion, targetView: AnyView(AppVersionView())),
                .init(title: .appFeedback, targetView: AnyView(AppFeedbackView())),
                .init(title: .disclaimer, targetView: AnyView(DisclaimerView()))
            ]
        }
    }
}
// MARK:- More List Item
struct MoreListRow: Identifiable{
    var id = UUID()
    var title: MoreListRowType
    var targetView: AnyView = AnyView(EmptyView())
}
// MARK:- Static title for More Sections
enum MoreListSectionType: String {
    case about
}
// MARK:- Static title for More Items(rows)
enum MoreListRowType: String{
    case appFeedback
    case theApp
    case appVersion
    case disclaimer
}
