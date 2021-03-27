//
//  SearchViewModel.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var apodResponse: APODResult?
    @Published var isLoading: Bool = true
    
    init() {
        NetworkManager.shared.getApodsFor(date: Date()) { (result) in
            DispatchQueue.main.async {
                self.apodResponse = result
                self.isLoading = false
            }
        }
    }
    
    
    /// function to get APOD for a specified date
    /// - Parameter dt: date of  apod
    func changeRes(date dt: Date) {
        NetworkManager.shared.getApodsFor(date: dt) { (result) in
            DispatchQueue.main.async {
                self.apodResponse = result
                self.isLoading = false
            }
        }
    }
}
