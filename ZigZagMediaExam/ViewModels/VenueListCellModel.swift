//
//  VenueListCellModel.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation

struct VenueListCellModel {
    let name: String
    let venueDistance: String
    
    init(venue: Venue) {
        self.name = venue.name
        self.venueDistance = "\(venue.location.distance) meters away"
    }
}
