//
//  FourSquareManager.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import Foundation
import MapKit
import FoursquareAPIClient

class FourSquareManager: NSObject {
    
    weak var delegate: FourSquareManagerDelegate?
    
    // MARK: Public Functions
    
    func fetchVenuesFrom(location: CLLocationCoordinate2D) {
        let client = FoursquareAPIClient(clientId: "VYEKOWMML4R5CZDEC5BBPHVNMS40CHTAMVHWVLOEFFCWUITT", 
                                         clientSecret: "DLSHZ524G4A5COIJOO0H0IV4IRFGSRYWXT2GAEBOQ11YSE1C")
        
        let parameter: [String: String] = [
            "ll": "\(location.latitude),\(location.longitude)"
            //            "ll": "37.785834000000001,-122.406417"
        ]
        
        client.request(path: "venues/search", parameter: parameter) { response in
            switch response {
            case let .success(data):
                guard let venue = try? JSONDecoder().decode(Response<VenuesResponse>.self, from: data) else {
                    print("Error: Couldn't decode data into Venue")
                    return
                }
                
                self.delegate?.fetchVenuesSuccessful(venues: venue.response.venues)
            
            case let .failure(error):
                self.delegate?.fetchVenuesFailed(error: error)
                print(error)
            }
        }
    }
    
}
