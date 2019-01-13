//
//  VenueDetailModel.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation

struct VenueDetailModel {
    let name: String
    var formattedAddress: [String]?
    
    init(venue: Venue) {
        self.name = venue.name
        if let locationAddress = venue.location.formattedAddress {
            self.formattedAddress = locationAddress
        }
    }
}
