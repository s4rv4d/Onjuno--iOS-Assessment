//
//  TodayContent.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct TodayContent: View {
    
    @StateObject var tcViewModel = TodaysContentViewModel()
    
    var body: some View {
        NavigationLink(destination: DetailView(item: tcViewModel)) {
            ZStack(alignment: .bottomLeading) {
                VStack {
                    WebImage(url: URL(string: tcViewModel.content))
                        .resizable()
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(8)
                }
                
                VStack(alignment: .leading) {
                    Text(tcViewModel.title)
                        .foregroundColor(.white)
                        .font(.body)
                        .fontWeight(.bold)
                    Text(tcViewModel.date)
                        .foregroundColor(.white)
                        .font(.caption)
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
            }.redacted(
                reason: tcViewModel.content == "redacted" ? .placeholder : []
            )
        }
    }
}

struct TodayContent_Previews: PreviewProvider {
    static var previews: some View {
        TodayContent()
    }
}
