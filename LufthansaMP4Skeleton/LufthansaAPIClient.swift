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
    static func getFlightStatus(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)" //FIXME
        let parameters: HTTPHeaders = ["Accept":"application/json", "Authorization":"Bearer \(self.authToken!)"] //FIXME

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
}
