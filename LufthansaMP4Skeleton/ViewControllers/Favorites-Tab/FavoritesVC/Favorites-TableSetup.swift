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
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath as IndexPath) as! FavoritesCellTableViewCell
        if (Favorites.favoritesList.count == 0){
            cell.flightName.text = "You have not selected a favorite flight yet"
            cell.flightPath.text = ""
            cell.flightTime.text = "Select through Flights Tab!"
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
            inputError()
            return
        }
        selectedFlight = Favorites.favoritesList[indexPath.row]
        performSegue(withIdentifier: "toFlightDetails", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FlightInfoViewController {
            destination.userFlight = selectedFlight
        }
    }
    
    func inputError(){
        let alert = UIAlertController(title: "Error!", message: "You do not have any favorites!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        //Favorites.favoritesList[IndexPath.row].isUserInteractionEnabled = true
    }
    
}
