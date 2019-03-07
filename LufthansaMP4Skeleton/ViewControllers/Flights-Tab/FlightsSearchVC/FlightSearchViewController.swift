//
//  ViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FlightSearchViewController: UIViewController {

    var welcomeImage : UIImageView!
    var searchbutton: UIButton!
    
    var flightNumberTextfield: UITextField!
    var flightDatePicker: UIDatePicker!
    var flightDate: String!
    var flightLabel: UILabel!
    
    var inputFlight: Flight!

    override func viewDidLoad() {
        super.viewDidLoad()
        flightSearchUISetup()
    }

}

