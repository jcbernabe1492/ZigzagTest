//
//  FourSquareManagerProtocols.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 13/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation

protocol FourSquareManagerDelegate: class {
    func fetchVenuesSuccessful(venues: [Venue])
    func fetchVenuesFailed(error: Error)
}
