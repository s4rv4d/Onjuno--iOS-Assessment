//
//  WeekListViewModel.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

class WeekListViewModel: ObservableObject {
    
    @Published var apodResults: [APODResult] = []
    @Published var isLoading: Bool = true
    
    init() {
        self.apodResults = []
        NetworkManager.shared.getCurrentWeeksAPOD { (results) in
            DispatchQueue.main.async {
                self.apodResults = results ?? []
                self.isLoading = false
            }
        }
    }
    
    
}
