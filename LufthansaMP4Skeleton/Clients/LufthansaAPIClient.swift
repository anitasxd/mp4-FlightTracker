//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON // FIXME

class LufthansaAPIClient {
    //These are where we will store all of the authentication information. Get these from your account at developer.lufthansa.com.
    static let clientSecret = "7EtS66XKXH"
    static let clientID = "47tuqzpcbtbkyxm933633rhq"
    
    //This variable will store the session's auth token that we will get from getAuthToken()
    static var authToken: String?
    
    static func getAuthToken(completion: @escaping () -> ()){
        let requestURL = "https://api.lufthansa.com/v1/oauth/token"
        let parameters = ["client_id": "\(clientID)", "client_secret": "\(clientSecret)", "grant_type": "client_credentials"]
        
        Alamofire.request(requestURL, method: .post, parameters: parameters, encoding: URLEncoding()).responseJSON { response in

         let json = JSON(response.result.value)
         self.authToken = json["access_token"].stringValue
         
         print("Auth token: " + self.authToken!)
         print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
         completion()
         }
    }
    
    //This function will get the status for a flight. FlightNum format "LHXXX" Date format "YYYY-MM-DD"
    static func getFlightInfo(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)"
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization":"Bearer \(self.authToken!)"]
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
         //Makes sure that response is valid
         guard response.result.isSuccess else {
            print(response.result.error.debugDescription)
            return
         }
         //Creates JSON object
         let json = JSON(response.result.value)
         print(json)
         //Create new flight model and populate data
         let flight = Flight(data: json, flightNum: flightNum, date: date)
         completion(flight)
         }

    }
    
    static func getAirportInfo(code: String, completion: @escaping (Airport) -> ()){
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/references/airports/\(code)?limit=20&offset=0&LHoperated=0"
        let parameters: HTTPHeaders = ["Authorization": "Bearer \(authToken!)", "Accept": "application/json"]

        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure thhat response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            let json = JSON(response.result.value)
            print(json)
            //Create new flight model and populate data
            let airport = Airport(data: json, code: code)
            completion(airport)
        }
    }
    
    static func getAirportCraft(code: String, completion: @escaping (Aircraft) -> ()){
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/references/aircraft/\(code)?limit=20&offset=0"
        let parameters: HTTPHeaders = ["Authorization": "Bearer \(authToken!)", "Accept": "application/json"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure thhat response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            let json = JSON(response.result.value)
            //Create new flight model and populate data
            let aircraft = Aircraft(data: json, code: code)
            completion(aircraft)
        }
    }
    
    static func getAllAirports(UIview : UIViewController, completion: @escaping ([Airport]) -> ()){
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/references/airports/?limit=100&offset=0&LHoperated=0"
        let parameters: HTTPHeaders = ["Authorization": "Bearer \(authToken!)", "Accept": "application/json"]
  
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure that response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            let json = JSON(response.result.value)
            //Create new flight model and populate data
            var airports : [Airport] = []
            for i in 0...99 { // store all the stuff into array first so can shorten code
                let airportCode = json["AirportResource"]["Airports"]["Airport"][i]["AirportCode"].stringValue
                let newAir = Airport(data: json, code: airportCode)
                newAir.airportName = json["AirportResource"]["Airports"]["Airport"][i]["Names"]["Name"][0]["$"].stringValue
                newAir.airportLat = json["AirportResource"]["Airports"]["Airport"][i]["Position"]["Coordinate"]["Latitude"].stringValue
                newAir.airportLong = json["AirportResource"]["Airports"]["Airport"][i]["Position"]["Coordinate"]["Longitude"].stringValue
                airports.append(newAir)
            }
            completion(airports)
        }
    }
    
    
    
}
