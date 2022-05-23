//
//  DisclaimerView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 24/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("The prayer times shown on the App purely calculation based. We tried our best to show the accurate time for a selected  location. In any case the prayer time shown on the App does not override your local mosque. But if you find a huge mismatch, please let us know through app feedback, so that we can investigate and improve the App.")
            }.padding()
        }.navigationBarTitle(Text("disclaimer".titleCase()).bold(),displayMode: .inline)
//            .onAppear{
//                let value: Int? = nil
//                print(value!)
//        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}

