//
//  VenueListCell.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 12/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import UIKit

class VenueListCell: UITableViewCell {
    
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueDistance: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Public Functions
    func setVenueData(venue: VenueListCellModel) {
        self.venueName.text = venue.name
        self.venueDistance.text = venue.venueDistance
    }

}
