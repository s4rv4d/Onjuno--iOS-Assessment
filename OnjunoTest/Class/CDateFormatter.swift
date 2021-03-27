//
//  CDateFormatter.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

/// Class to handle date formatting to a specified date need to use Nasa's APOD api
class CDateFormatter {
    
    static var shared = CDateFormatter()
    var mainDateFormatter = DateFormatter()
    
    init(dateFormatter: DateFormatter = DateFormatter()) {
        self.mainDateFormatter = dateFormatter
        //setup
        setup()
    }
    
    private func setup() {
        mainDateFormatter.dateFormat = "yyyy-M-d"
        mainDateFormatter.timeZone = .autoupdatingCurrent
    }
    
    func currentDate() -> Date {
        return Date()
    }
    
    func getDatesOfWeek() -> [String] {
        let c = Calendar.autoupdatingCurrent
        let datesArray = c.daysWithSameWeekOfYear(as: Date())
        let stringArray = datesArray.map({
            getStringFromDate(date: $0)
        })
        return stringArray
    }
    
    func getStringFromDate(date: Date) -> String {
        return mainDateFormatter.string(from: date)
    }
    
    func currentDateString() -> String {
       let date = mainDateFormatter.string(from: Date())
        return date
    }
    
    func getDateVersion(from String: String) -> Date {
        let dateStr = mainDateFormatter.date(from: String)!
        return dateStr
    }
}
