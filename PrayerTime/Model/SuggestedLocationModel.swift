// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let suggestedLocationModel = try? newJSONDecoder().decode(SuggestedLocationModel.self, from: jsonData)

import SwiftUI

// MARK: - SuggestedLocationModel
struct SuggestedLocationModel: Codable, Hashable {
    let totalResultsCount: Int?
    let geonames: [Geoname]?
}

// MARK: - Geoname
struct Geoname: Codable, Hashable {
    static func == (lhs: Geoname, rhs: Geoname) -> Bool {
        lhs.geonameID == rhs.geonameID
    }
    
    let adminCode1, lng: String?
    let geonameID: Int?
    let toponymName, countryID, fcl: String?
    let population: Int?
    let countryCode, name, fclName: String?
    let adminCodes1: AdminCodes1?
    let countryName, fcodeName, adminName1, lat: String?
    let fcode: String?

    enum CodingKeys: String, CodingKey {
        case adminCode1, lng
        case geonameID = "geonameId"
        case toponymName
        case countryID = "countryId"
        case fcl, population, countryCode, name, fclName, adminCodes1, countryName, fcodeName, adminName1, lat, fcode
    }
}

// MARK: - AdminCodes1
struct AdminCodes1: Codable, Hashable {
    let iso31662: String?

    enum CodingKeys: String, CodingKey {
        case iso31662 = "ISO3166_2"
    }
}
