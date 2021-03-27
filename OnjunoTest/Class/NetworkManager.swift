//
//  NetworkManager.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

/// class handling all the network calls being made
class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    // MARK: - Properties
    private let apiKey = "gHVnCcF3geNV8bxFHNnV7io7IM5E9QNh0RKZ5nLN"
    private let baseURL = "https://api.nasa.gov/planetary/apod"
    private let baseURL2 = "http://demo0405353.mockable.io/get-nasa-photos"
    
    // MARK: - Functions
    
    ///gets the current day's APOD
    func getTodaysAPOD(completion: @escaping(_ result: APODResult?) -> ()) {
        guard let url = URL(string: baseURL) else {
            print("invalid URL")
            completion(nil)
            return
        }
        
        var requestParameters = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard requestParameters != nil else {
            completion(nil)
            return
        }
        // can force unwrap since we doing check before
        requestParameters!.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
        guard let finalURL = requestParameters!.url else {
            completion(nil)
            return
        }
        // request
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil || data == nil {
                completion(nil)
                return
            }
            
            if let data = data {
                if let decodedResults = try? JSONDecoder().decode(APODResult.self, from: data) {
//                    print(decodedResults)
                    completion(decodedResults)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
    
    /// gets APOD for a specified date
    /// - Parameters:
    ///   - dt: date to search for
    ///   - completion: final result
    /// - Returns: void
    func getApodsFor(date dt: Date, completion: @escaping(_ result: APODResult?) -> ()) {
        guard let url = URL(string: baseURL) else {
            print("invalid URL")
            completion(nil)
            return
        }
        
        var requestParameters = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard requestParameters != nil else {
            completion(nil)
            return
        }
        
        let date = CDateFormatter.shared.getStringFromDate(date: dt)
        
        requestParameters!.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "date", value: date),
        ]
        
        guard let finalURL = requestParameters!.url else {
            completion(nil)
            return
        }
        
        // request
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil || data == nil {
                completion(nil)
                return
            }
            
            if let data = data {
                if let decodedResults = try? JSONDecoder().decode(APODResult.self, from: data) {
                    print(decodedResults)
                    completion(decodedResults)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
    /// gets the current week's APOD
    /// - Parameter completion: final result
    /// - Returns: void
    func getCurrentWeeksAPOD(completion: @escaping([APODResult]?) -> ()) {
        guard let url = URL(string: baseURL) else {
            print("invalid URL")
            completion(nil)
            return
        }
        
        var requestParameters = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard requestParameters != nil else {
            completion(nil)
            return
        }
        
        let dates = CDateFormatter.shared.getDatesOfWeek()
        guard dates != [] else {
            completion(nil)
            return
        }
        let startDate = dates.first
        let endDate = dates.last
        
        requestParameters!.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "start_date", value: startDate),
            URLQueryItem(name: "end_date", value: endDate)
        ]
        
        guard let finalURL = requestParameters!.url else {
            completion(nil)
            return
        }
        // request
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil || data == nil {
                completion(nil)
                return
            }
            
            if let data = data {
                if let decodedResults = try? JSONDecoder().decode([APODResult].self, from: data) {
//                    print(decodedResults)
                    completion(decodedResults)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
    /// getting the APODs using the url specified in doc
    /// - Parameter completion: final result
    /// - Returns: void
    func getApods(completion: @escaping(Photos?) -> ()) {
        guard let url = URL(string: baseURL2) else {
            print("invalid URL")
            completion(nil)
            return
        }
        
        // request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil || data == nil {
                completion(nil)
                return
            }
            
            if let data = data {
                if let decodedResults = try? JSONDecoder().decode(Photos.self, from: data) {
                    print(decodedResults)
                    completion(decodedResults)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
