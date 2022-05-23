//
//  QuiblaView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 12/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI
import Adhan
import CoreLocation

struct QiblaView: View{
    @ObservedObject var compassHeading: CompassHeading = CompassHeading()
    var body: some View{
        ZStack{
            BackGroundView()
            VStack{
                Text("N")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                Capsule()
                    .frame(width: 5, height: 25)
                ZStack {
                    Compass()
                    UpperNeedle()
                    LowerNeedle()
                    InnerPin()
                    ForEach(Marker.markers(), id: \.self) { marker in
                        CompassMarkerView(marker: marker, compassDegress: 0)
                    }
                    QiblaLine(compassDegree: 210)
                }
                .frame(width: 320, height: 320)
                .rotationEffect(Angle(degrees: compassHeading.degrees))
                .statusBar(hidden: true)
                
                .padding(.bottom)
                
                Text("* Align the north (red) line with the 'N' (in red). The yellow line will indicate the Qibla direction for current location.")
                    .font(.caption)
                    .fontWeight(.semibold)
               // .padding()
            }.padding()
        }
    }
}

struct QiblaView_Previews: PreviewProvider {
    static var previews: some View {
        QiblaView()
    }
}



