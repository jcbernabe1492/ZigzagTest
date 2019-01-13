//
//  ViewController.swift
//  ZigZagMediaExam
//
//  Created by John Christopher Bernabe on 10/01/2019.
//  Copyright © 2019 John Christopher Bernabe. All rights reserved.
//

import UIKit
import MapKit
import FoursquareAPIClient

class ViewController: UIViewController {
    
    @IBOutlet weak var venuesTable: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    let locationManager = CLLocationManager()
    private var venuesData: [Venue] = []
    private var selectedVenue: Venue?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        locationManager.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.startUpdatingLocation()
        venuesTable.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowVenueDetail" {
            if let venue = self.selectedVenue {
                let venueDetailVC = segue.destination as! VenuDetailViewController
                venueDetailVC.setVenueDetails(venue: VenueDetailModel(venue: venue))
            }
        }
    }
    
    // MARK: Private Functions
    
    private func fetchLocations(location: CLLocationCoordinate2D) {
        let manager = FourSquareManager()
        manager.delegate = self
        manager.fetchVenuesFrom(location: location)
    }
}

extension ViewController: FourSquareManagerDelegate {
    func fetchVenuesSuccessful(venues: [Venue]) {
        self.venuesData = venues
        self.venuesTable.reloadData()
        self.venuesTable.isHidden = false
        self.loader.isHidden = true
    }
    
    func fetchVenuesFailed(error: Error) {
        self.venuesTable.isHidden = false
        self.loader.isHidden = true
        let alert = UIAlertController(title: "Fetch Failed", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.fetchLocations(location: location.coordinate)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venuesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueListCell", for: indexPath) as! VenueListCell
        cell.setVenueData(venue: VenueListCellModel(venue: self.venuesData[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedVenue = self.venuesData[indexPath.row]
        self.performSegue(withIdentifier: "ShowVenueDetail", sender: self)
    }
}
