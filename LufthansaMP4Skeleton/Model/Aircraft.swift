//
//  Aircraft.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON
class Aircraft {
    
    //info for airport
    var aircraftCode: String!
    var aircraftName: String!
    
    init(data: JSON, code: String) {
        //flightTimes setup
        self.aircraftCode = code
        aircraftName = data["AircraftResource"]["AircraftSummaries"]["AircraftSummary"]["Names"]["Name"]["$"].stringValue
    }
}
