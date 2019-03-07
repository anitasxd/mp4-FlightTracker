//
//  ViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FlightSearchViewController: UIViewController {

    var label: UILabel!
    var searchbutton: UIButton!
    
    var flightNumberTextfield: UITextField!
    var flightDatePicker: UIDatePicker!
    
    var flightDate: String!
    
    var inputFlight: Flight!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flightSearchUISetup()
    }

}

