//
//  DetailView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @ObservedObject var item: TodaysContentViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
                Text(item.title)
                    .font(.title)
                    .bold()
                
                WebImage(url: URL(string: item.content))
                    .resizable()
                    .placeholder {
                        if item.mediaType == "video" {
                            Image("nasa")
                                .resizable()
                                .frame(height: 300, alignment: .center)
                                .scaledToFit()
                                .onTapGesture {
                                    UIApplication.shared.open(URL(string: item.content)!, options: [:], completionHandler: nil)
                                }
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                        }
                    }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text("Copyright")
                    Text(item.copyright)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }.padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("Explanation")
                    Text(item.explanation)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }.padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("Media type")
                    Text(item.mediaType ?? "No info")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }.padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("Website URL")
                    /// When a user taps or clicks a `Link`, where the URL opens depends on the
                    /// contents of the URL. For example, a Universal Link will open in the
                    /// associated app, if possible, but otherwise in the user's default web
                    /// browser.
                    Link(item.content, destination: URL(string: item.content)!)
                        .font(.caption)
                }.padding([.top, .bottom])
                
                VStack(alignment: .leading) {
                    Text("Created on")
                    Text(item.date)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }.padding([.top, .bottom])
            }
            .padding(.horizontal, 16)
        }
    }
}

