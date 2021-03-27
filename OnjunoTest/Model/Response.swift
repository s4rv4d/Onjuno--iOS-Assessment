//
//  Response.swift
//  OnjunoTest
//
//  Created by Sarvad Shetty on 27/03/2021.
//

import Foundation

/// Model used to decode response while making network request
struct Photos: Codable {
    var photos: [APODResult]?
}


/// Model used to decode response while making network request
struct APODResult: Codable, Identifiable, Hashable {
    // for list, so that model can conform to indentifiable
    var id: UUID = UUID()
    
    var copyright: String?
    var date: String? // YYYY-MM-DD from api
    var explanation: String?
    var hdURL: String?
    var mediaType: String?
    var serviceVersion: String?
    var title: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case copyright      = "copyright"
        case date           = "date"
        case explanation    = "explanation"
        case hdURL          = "hdurl"
        case mediaType      = "media_type"
        case serviceVersion = "service_version"
        case title          = "title"
        case url            = "url"
    }

    init(from decoder: Decoder) throws {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
        copyright       = try values.decodeIfPresent(String.self, forKey: .copyright)
        date            = try values.decodeIfPresent(String.self, forKey: .date)
        explanation     = try values.decodeIfPresent(String.self, forKey: .explanation)
        hdURL           = try values.decodeIfPresent(String.self, forKey: .hdURL)
        mediaType       = try values.decodeIfPresent(String.self, forKey: .mediaType)
        serviceVersion  = try values.decodeIfPresent(String.self, forKey: .serviceVersion)
        title           = try values.decodeIfPresent(String.self, forKey: .title)
        url             = try values.decodeIfPresent(String.self, forKey: .url)
    }
}
