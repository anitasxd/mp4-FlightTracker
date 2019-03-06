//
//  Flight.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON
class Flight {

    //times of flight
    var flightNum: String!
    var flightTime: String!
    var timeStatus: String!
    var departureTime: String!
    var arrivalTime: String!
    
    
    //location of flight
    var originAirport: String!
    var destinationAirport: String!
    var boardingGate: String!
    
    //aircraft
    var aircraftType: String!
    
    init(data: JSON, flightNum: String, date: String) {
        self.flightNum = flightNum
        self.flightTime = date
        
        //flightTimes setup
        timeStatus = data["FlightStatusResource"]["Flights"]["Flight"]["FlightStatus"]["Definition"].stringValue
        departureTime = data["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["ScheduledTimeLocal"]["DateTime"].stringValue
        arrivalTime = data["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["ScheduledTimeLocal"]["DateTime"].stringValue
        
        
        //location setup
        originAirport = data["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["AirportCode"].stringValue
        destinationAirport = data["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["AirportCode"].stringValue
        boardingGate = data["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["Terminal"]["Gate"].stringValue
        
    
        
        
        
    }
    
}
