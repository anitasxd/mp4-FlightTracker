//
//  Info- Table.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit

extension AirportInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flightsTable.dequeueReusableCell(withIdentifier: "airPortsFlights", for: indexPath as IndexPath) as! InfoTableCell
        if (Favorites.favoritesList.count == 0){
            cell.flightName.text = "Cannot Load Flights"
            cell.flightPath.text = ""
            cell.flightTime.text = "Try Again Later"
        } else {
            let flight = Favorites.favoritesList[indexPath.row]
            cell.flightName.text = "Flight: \(flight.flightNum!)"
            cell.flightPath.text = "From ✈ \(flight.originAirport!) → To ✈ \(flight.destinationAirport!)"
            cell.flightTime.text = "Status: \(flight.timeStatus!)"
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (Favorites.favoritesList.count == 0) {
            return 1
        }
        return Favorites.favoritesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (Favorites.favoritesList.count == 0){
            return
        }
        //selectedFlight = Favorites.favoritesList[indexPath.row]
        performSegue(withIdentifier: "toFlightDetails", sender: (Any).self)
    }
    
}
