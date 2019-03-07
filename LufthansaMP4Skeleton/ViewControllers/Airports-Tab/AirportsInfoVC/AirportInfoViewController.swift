//
//  AirportInfoViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class AirportInfoViewController: UIViewController {
    var airportCode : String!
    var code : String!
    var mapView : MKMapView!
    var selectedAirport : MKPointAnnotation?
    
    var flightsTable : UITableView!
    
    var segmentControl = UISegmentedControl(items: ["Departure", "Arrival"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAirportCode()
        mapViewSetup()
        uiSetup()
        // Do any additional setup after loading the view.
    }
    
    func getAirportCode(){
        if (airportCode != nil){
            let fullNameArr = airportCode.components(separatedBy: ", ")
            let surname = fullNameArr[1]
            code = surname
            print(code!)
            return
        }
        airportCode = code
    }
    

}
