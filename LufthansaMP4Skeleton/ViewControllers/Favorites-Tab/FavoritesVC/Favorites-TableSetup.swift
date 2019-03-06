//
//  Favorites-TableSetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath as IndexPath) as! FavoritesCellTableViewCell
        let flight = favoriteFlights[indexPath.row]
        cell.flightName.text = "Flight: \(flight.flightNum!)"
        cell.flightPath.text = "From ✈ \(flight.originAirport!) → To ✈ \(flight.destinationAirport!)"
        cell.flightStatus.text = "Status: \n \(flight.timeStatus!)"
        
        // Initialize Cell
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFlights.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3 + 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedEvent = eventsList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
