//
//  HomeView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var hvViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(hvViewModel.listData, id: \.self) { item in
                        HomeListItemRow(item: item)
                    }
                }.listStyle(InsetGroupedListStyle())
                
                if hvViewModel.isLoading {
                    VStack {
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.5))
                            VStack(alignment: .leading) {
                                Text("Redacted")
                                    .foregroundColor(.white)
                                    .font(.body)
                                Text("Redacted")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 4)
                                
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .cornerRadius(8)
                        .redacted(
                            reason: hvViewModel.isLoading ? .placeholder : []
                        )
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle(Text("APODs"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
