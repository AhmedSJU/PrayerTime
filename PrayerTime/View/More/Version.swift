//
//  Version.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 24/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct AppVersionView: View {
    var body: some View {
        ZStack {
            VStack{
                Text(Bundle.main.appName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("splash")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.blue)
                Text("Version: \(Bundle.main.shortVersion)")
                Text("Build: \(Bundle.main.buildVersion)")
            }.padding()
        }.navigationBarTitle(Text(MoreListRowType.appVersion.rawValue.titleCase()).bold(),displayMode: .inline)
    }
}

struct AppVersionView_Previews: PreviewProvider {
    static var previews: some View {
        AppVersionView()
    }
}

