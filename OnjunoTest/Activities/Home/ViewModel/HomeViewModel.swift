//
//  HomeViewModel.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var apodResponse: Photos?
    @Published var isLoading: Bool = true
    
    init() {
        NetworkManager.shared.getApods { (photos) in
            DispatchQueue.main.async {
                self.apodResponse = photos
                self.isLoading = false
            }
        }
    }
    
    var listData: [APODResult] {
        guard apodResponse != nil else {
            return []
        }
        
        return apodResponse!.photos!
    }
}
