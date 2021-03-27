//
//  DiscoverView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
//            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    TodayContent()
                            
                    WeekListView()
                    Spacer()
                }
                .padding(.horizontal, 16)
//            }
                
            .navigationTitle(Text("Discover"))
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
