//
//  Location.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation

struct Location: Codable {
    let address: String?
    let crossStreet: String?
    let city: String?
    let state: String?
    let postalCode: String?
    let country: String?
    let formattedAddress: [String]?
    
    let distance: Int // measured in meters
    
    private enum CodingKeys: String, CodingKey {
        case address
        case crossStreet
        case city
        case state
        case postalCode
        case country
        case distance
        case formattedAddress
    }
}
