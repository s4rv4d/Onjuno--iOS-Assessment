//
//  SearchView.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - @State variables
    @State var selectedDate = Date()
    
    // MARK: - @State objects
    @StateObject var sViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select date", selection: $selectedDate.onChange {
                    self.sViewModel.changeRes(date: selectedDate)
                })
                .datePickerStyle(CompactDatePickerStyle())
                
                if sViewModel.isLoading {
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
                            reason: sViewModel.isLoading ? .placeholder : []
                        )
                        Spacer()
                    }
                } else {
                    NavigationLink(destination: DetailView2(item: sViewModel.apodResponse!)) {
                        ZStack {
                            Rectangle()
                                .fill(Color.secondarySystemGroupedBackground)
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(sViewModel.apodResponse!.title!)
                                    Text(sViewModel.apodResponse!.date!)
                                        .font(.caption)
                                }
                                Spacer()
                                Image(systemName: sViewModel.apodResponse!.mediaType! == "image" ? "photo" : "video")
                                    .foregroundColor(sViewModel.apodResponse!.mediaType! == "image" ? .purple : .blue)
                            }.padding(.horizontal)
                        }
                        .cornerRadius(8)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    }
                }
                
                Spacer()
            }.padding(.horizontal, 16)
            .navigationTitle(Text("Custom Search"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
