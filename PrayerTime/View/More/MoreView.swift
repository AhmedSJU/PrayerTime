//
//  MoreView.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 22/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    @ObservedObject var moreViewModel: MoreViewModel = MoreViewModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(self.moreViewModel.moreMenuList.section) { item in
                    Section(header: Text(item.title.rawValue.titleCase()).bold().frame(height: 50)) {
                        ForEach(item.rows, id: \.id) { row in
                            NavigationLink(destination: row.targetView){
                                Text(row.title.rawValue.titleCase())
                            }.navigationBarTitle("")
                        }
                    }
            
                }
                .navigationBarTitle(Text("More").bold(),displayMode: .inline)
            }
            
        }.onAppear {
            UITableView.appearance().tableFooterView = UIView()
        }
    .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}

