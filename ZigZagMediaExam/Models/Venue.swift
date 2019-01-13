//
//  Venue.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 11/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation

struct Venue: Codable {
    let venueId: String
    let name: String
    let location: Location
    
    private enum CodingKeys: String, CodingKey {
        case venueId = "id"
        case name
        case location
    }
}


