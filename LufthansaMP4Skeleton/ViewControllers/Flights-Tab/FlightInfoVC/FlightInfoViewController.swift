//
//  FlightInfoViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class FlightInfoViewController: UIViewController {
    var userFlight : Flight!
    var mapView: MKMapView!
    
    //stats labels
    var flightName: UILabel!
    var flightPath: UILabel!
    var flightStatus: UILabel!
    var flightOrigin: UILabel!
    var originTime: UILabel!
    var flightDestination: UILabel!
    var destinationTime: UILabel!
    var boardingGate: UILabel!
    var aircraftType: UILabel!
    
    var aircraftImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetup()
        uiSetup()
        // Do any additional setup after loading the view.
    }
    

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FavoritesViewController {
            destination.selectedFlight = userFlight
        }
    }*/


}
