//
//  UpperNeedle.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 25/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct UpperNeedle: View {
    private var needleBottom: CGFloat = 5.0
    private var needleLength: CGFloat = 50.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: geometry.size.width / 2 - self.needleBottom , y: geometry.size.height / 2))
                
                path.addLine(to: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2 - self.needleLength))
                
                path.addLine(to: CGPoint(x: geometry.size.width / 2 + self.needleBottom , y: geometry.size.height / 2))
                
            }.foregroundColor(.red)
            
        }
    }
}

struct UpperNeedle_Previews: PreviewProvider {
    static var previews: some View {
        UpperNeedle()
    }
}
