//
//  InnerPin.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 25/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct InnerPin: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 11, height: 11)
                .foregroundColor(.gray)
            Circle()
                .frame(width: 9, height: 9)
                .foregroundColor(.clear)
                .overlay(
                    Circle()
                        .stroke(Color.black)
            )
            Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(.clear)
                .overlay(
                    Circle()
                        .stroke(Color.black)
            )
        }
    }
}

struct InnerPin_Previews: PreviewProvider {
    static var previews: some View {
        InnerPin()
    }
}
