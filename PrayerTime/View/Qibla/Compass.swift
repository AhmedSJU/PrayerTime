//
//  Compass.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 25/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI

struct Compass: View {
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                Circle()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .foregroundColor(.clear)
                    .overlay(
                        Circle()
                            .stroke(Color.blue)
                )
            }
        }
    }
}


struct Compass_Previews: PreviewProvider {
    static var previews: some View {
        Compass()
    }
}
