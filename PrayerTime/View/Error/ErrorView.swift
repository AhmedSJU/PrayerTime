//
//  ErrorView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 14/06/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    @State var error: String?
    var body: some View {
        VStack{
            Text(error ?? "Something went wrong, try again.")
                .font(.caption)
                .foregroundColor(.red)
        }.padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
