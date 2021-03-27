//
//  TodayContentViewModel.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

class TodaysContentViewModel: ObservableObject {
    
    @Published var apodResponse: APODResult?
    
    init() {
        NetworkManager.shared.getTodaysAPOD { (result) in
            DispatchQueue.main.async {
                self.apodResponse = result
            }
        }
    }
    
    var date: String {
        guard apodResponse != nil else {
            return "Test"
        }
        return apodResponse?.date ?? "Test"
    }
    
    var result: APODResult? {
        guard apodResponse != nil else {
            return nil
        }
        
        return apodResponse!
    }
    
    var title: String {
        guard apodResponse != nil else {
            return "Test"
        }
        return apodResponse?.title ?? "Test"
    }
    
    var copyright: String {
        guard apodResponse != nil else {
            return "Test"
        }
        return apodResponse?.copyright ?? "Test"
    }
    
    var mediaType: String {
        guard apodResponse != nil else {
            return "Test"
        }
        return apodResponse?.mediaType ?? "Test"
    }
    
    var explanation: String {
        guard apodResponse != nil else {
            return "Test"
        }
        return apodResponse?.explanation ?? "Test"
    }
    
    var content: String {
        
        guard apodResponse != nil else {
            return "redacted"
        }
        
        if apodResponse != nil {
            if apodResponse!.mediaType == "image" {
                return apodResponse!.url!
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
}
