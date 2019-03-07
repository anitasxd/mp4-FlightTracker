//
//  AirportsViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class AirportsViewController: UIViewController {
    var allAirports: [Airport]!
    var mapView : MKMapView!
    var selectedAirport : MKPointAnnotation?
    var airportCode : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewSetup()
        // Do any additional setup after loading the view.
    }
    

}
