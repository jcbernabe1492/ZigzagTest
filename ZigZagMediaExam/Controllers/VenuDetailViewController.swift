//
//  VenuDetailViewController.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import UIKit

class VenuDetailViewController: UIViewController {
    
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueAddress: UILabel!
    
    private var venueModel: VenueDetailModel? 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        populateVenueDetails()
    }
    
    // MARK: Public Functions
    
    func setVenueDetails(venue: VenueDetailModel) {
        self.venueModel = venue
    }
    
    // MARK: Private Functions
    
    private func populateVenueDetails() {
        guard let venue = self.venueModel else {
            return
        }
        
        venueName.text = venue.name
        
        if let address = venue.formattedAddress {
            var completeAddress: String = ""
            for subAddress in address {
                completeAddress.append("\(subAddress)\n")
            }
            venueAddress.text = completeAddress
        }
    }
}
