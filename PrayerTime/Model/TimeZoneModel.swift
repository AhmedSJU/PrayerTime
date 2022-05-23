// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timeZoneModel = try? newJSONDecoder().decode(TimeZoneModel.self, from: jsonData)

import Foundation

// MARK: - TimeZoneModel
struct TimeZoneModel: Codable {
    let sunrise: String?
    let lng: Double?
    let countryCode: String?
    let gmtOffset, rawOffset: Double?
    let sunset, timezoneID: String?
    let dstOffset: Double?
    let countryName, time: String?
    let lat: Double?

    enum CodingKeys: String, CodingKey {
        case sunrise, lng, countryCode, gmtOffset, rawOffset, sunset
        case timezoneID = "timezoneId"
        case dstOffset, countryName, time, lat
    }
}
