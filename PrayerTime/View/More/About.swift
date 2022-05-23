//
//  AboutTheAppView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 23/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Sheikh Jamal Uddin Ahmed. © \(Date().getYear())")
                    .bold()
            }.padding()
        }.navigationBarTitle(Text("aboutTheApp".titleCase()).bold(),displayMode: .inline)
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}

