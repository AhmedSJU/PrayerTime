//
//  CompassMarks.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 25/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double

    var body: some View {
        VStack {
            Text(marker.degreeText())
                    .fontWeight(.light)
                    .rotationEffect(self.textAngle())

            Capsule()
                    .frame(width: self.capsuleWidth(),
                            height: self.capsuleHeight())
                    .foregroundColor(self.capsuleColor())
                    .padding(.bottom, 120)

            Text(marker.label)
                    .fontWeight(.bold)
                    .rotationEffect(self.textAngle())
                    .padding(.bottom, 80)
        }.rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 7 : 3
    }
    
    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 45 : 30
    }
    
    private func capsuleColor() -> Color {
        return self.marker.degrees == 0 ? .red : .gray
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}

struct QiblaLine: View {
    @State var compassDegree: Double? = nil
    var body: some View{
        VStack {
            if compassDegree != nil {
                Capsule()
                .frame(width: 70, height: 5)
                .foregroundColor(.yellow)
                .offset(x: -40)
                .rotationEffect(Angle(degrees: compassDegree!))
            }
        }
    }
}
