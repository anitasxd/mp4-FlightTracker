//
//  Airport.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON
class Airport {
    
    //info for airport
    var airportCode: String!
    var airportName: String!
    var airportLat: String!
    var airportLong: String!
    
    init(data: JSON, code: String) {
        //flightTimes setup
        self.airportCode = code
        airportName = data["AirportResource"]["Airports"]["Airport"]["Names"]["Name"]["$"].stringValue
        airportLat = data["AirportResource"]["Airports"]["Airport"]["Position"]["Coordinate"]["Latitude"].stringValue
        airportLong = data["AirportResource"]["Airports"]["Airport"]["Position"]["Coordinate"]["Longitude"].stringValue
    }
}
