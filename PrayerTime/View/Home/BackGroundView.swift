//
//  BackGroundView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 11/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct BackGroundView: View {
    var body: some View {
        ZStack{
            Image("splash")
            .resizable()
                .edgesIgnoringSafeArea(.all)
                
        }.opacity(0.25)
    }
}

struct BackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundView()
    }
}
