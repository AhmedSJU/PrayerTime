//
//  RoundedRectangle.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 09/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
import SwiftUI
struct CustomTextBorder: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(.blue)
    }
}
