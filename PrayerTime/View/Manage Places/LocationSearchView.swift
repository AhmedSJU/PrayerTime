//
//  AutoCompleteView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 27/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI
import Combine

struct LocationSearchView: View {
    @ObservedObject var locationViewModel: AddLocationViewModel
    @State private var searchString: String = ""
    @State var oldValue: String = ""
    @State var searchTask: DispatchWorkItem? = nil
    var body: some View {
        TextField("Search for location", text: $searchString)
        .padding()
            .onReceive(Just(searchString), perform: { (newValue) in
                self.searchTask?.cancel()
                let task = DispatchWorkItem { [self] in
                    self.sendSearchRequest(newValue: newValue)
                }
                self.searchTask = task
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25, execute: task)
            })
            .frame(height: 35)
            .overlay( RoundedRectangle(cornerRadius: 5).stroke(Color.blue, lineWidth: 1)
        )
    }
    private func sendSearchRequest(newValue: String){
        if self.oldValue != newValue {
            self.locationViewModel.getList(forLocation: newValue, numberOfResults: 5)
        }
        self.oldValue = newValue
    }
}

