//
//  ContentView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            DiscoverView()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Discover")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "sparkle")
                    Text("APOD")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
