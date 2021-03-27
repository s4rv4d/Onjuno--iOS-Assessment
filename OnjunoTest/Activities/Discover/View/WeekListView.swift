//
//  WeekListView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeekListView: View {
    
    @StateObject var wLViewModel = WeekListViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("This Week")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(wLViewModel.apodResults) { result in
                        NavigationLink(destination: DetailView2(item: result)) {
                            ZStack(alignment: .bottomLeading) {
                                WebImage(url: URL(string: result.url!))
                                    .resizable()
                                    .indicator(.activity) // Activity Indicator
                                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                    .frame(width: UIScreen.main.bounds.width - 64, height: 220)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text(result.title!)
                                        .foregroundColor(.white)
                                        .font(.body)
                                        .fontWeight(.bold)
                                    Text(result.date!)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 4)
                            }
                        }
                    }
                }
            }
            
            if wLViewModel.isLoading {
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
                .frame(width: UIScreen.main.bounds.width - 64, height: 220)
                .cornerRadius(8)
                .redacted(
                    reason: wLViewModel.isLoading ? .placeholder : []
                )
            }
            
            
                    
        }
    }
}

struct WeekListView_Previews: PreviewProvider {
    static var previews: some View {
        WeekListView()
    }
}
