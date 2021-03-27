//
//  HomeListItemRow.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI

struct HomeListItemRow: View {
    
    let item: APODResult
    
    var body: some View {
        NavigationLink(destination: DetailView2(item: item)) {
            HStack{
                VStack(alignment: .leading) {
                    Text(item.title!)
    //                    .font(.title3)
                    Text(item.date!)
                        .font(.caption)
                }
                Spacer()
                Image(systemName: item.mediaType! == "image" ? "photo" : "video")
                    .foregroundColor(item.mediaType! == "image" ? .purple : .blue)
            }
        }
    }
}
