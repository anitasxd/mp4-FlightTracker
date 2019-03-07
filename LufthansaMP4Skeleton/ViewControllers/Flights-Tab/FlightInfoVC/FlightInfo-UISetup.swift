//
//  FlightInfoViewController-UISetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FlightInfoViewController {

    func uiSetup(){
        init_nav_button()
        statsSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func statsSetup(){
        flightName = UILabel(frame: CGRect(x: 0, y: mapView.frame.maxY + 10, width: view.frame.width, height: 50))
        flightName.text = "Flight \(userFlight.flightNum!)"
        flightName.font = UIFont(name: "Helvetica", size: 22)
        flightName.textAlignment = .center
        view.addSubview(flightName)
        
        flightPath = UILabel(frame: CGRect(x: 0, y: flightName.frame.maxY + 5, width: view.frame.width, height: 50))
        flightPath.text = "✈ \(userFlight.originAirport!) → ✈ \(userFlight.destinationAirport!)"
        flightPath.font = UIFont(name: "Helvetica", size: 18)
        flightPath.textAlignment = .center
        view.addSubview(flightPath)
        
        flightStatus = UILabel(frame: CGRect(x: 0, y: flightPath.frame.maxY + 10, width: view.frame.width/3, height: 50))
        flightStatus.numberOfLines = 0;
        flightStatus.text = "Status: \n \(userFlight.timeStatus!)"
        flightStatus.font = UIFont(name: "Helvetica", size: 14)
        flightStatus.textAlignment = .center
        view.addSubview(flightStatus)
        
        boardingGate = UILabel(frame: CGRect(x: 0, y: flightStatus.frame.maxY + 5, width: view.frame.width/3, height: 50))
        boardingGate.numberOfLines = 0;
        boardingGate.text = "Gate: \n\(userFlight.boardingGate!)"
        boardingGate.font = UIFont(name: "Helvetica", size: 14)
        boardingGate.textAlignment = .center
        view.addSubview(boardingGate)
        
        flightOrigin = UILabel(frame: CGRect(x: 135 , y: flightPath.frame.maxY + 10, width: view.frame.width/3, height: 50))
        flightOrigin.numberOfLines = 0;
        flightOrigin.text = "Departure Airport: \n\(userFlight.originAirport!)"
        flightOrigin.font = UIFont(name: "Helvetica", size: 14)
        flightOrigin.textAlignment = .center
        view.addSubview(flightOrigin)
        
        originTime = UILabel(frame: CGRect(x: 135 , y: flightStatus.frame.maxY + 5, width: view.frame.width/3, height: 50))
        originTime.numberOfLines = 0;
        originTime.text = "Departure Time: \n\(userFlight.departureTime!)"
        originTime.font = UIFont(name: "Helvetica", size: 14)
        originTime.textAlignment = .center
        view.addSubview(originTime)
        
        flightDestination = UILabel(frame: CGRect(x: 270, y: flightPath.frame.maxY + 10, width: view.frame.width/3, height: 50))
        flightDestination.numberOfLines = 0;
        flightDestination.text = "Arrival Airport: \n\(userFlight.destinationAirport!)"
        flightDestination.font = UIFont(name: "Helvetica", size: 14)
        flightDestination.textAlignment = .center
        view.addSubview(flightDestination)
        
        originTime = UILabel(frame: CGRect(x: 270, y: flightStatus.frame.maxY + 5, width: view.frame.width/3, height: 50))
        originTime.numberOfLines = 0;
        originTime.text = "Arrival Time: \n\(userFlight.arrivalTime!)"
        originTime.font = UIFont(name: "Helvetica", size: 14)
        originTime.textAlignment = .center
        view.addSubview(originTime)
        
        aircraftType = UILabel(frame: CGRect(x: 0, y: boardingGate.frame.maxY + 15, width: 150, height: 50))
        aircraftType.numberOfLines = 0;
        aircraftType.font = UIFont(name: "Helvetica", size: 14)
        aircraftType.textAlignment = .center
        view.addSubview(aircraftType)
      
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getAirportCraft(code: "\(self.userFlight.aircraftType!)") { (aircraft) in
                self.aircraftType.text = "Aircraft Type: \n\(aircraft.aircraftName!)"
            }
        }
        
        aircraftImage  =  UIImageView(frame: CGRect(x: aircraftType.frame.maxX, y: boardingGate.frame.maxY-65, width: view.frame.width - 200, height: 200))
        aircraftImage.image = UIImage(named: "aircraft")
        aircraftImage.contentMode = .scaleAspectFit
        view.addSubview(aircraftImage)

    }
    
    func init_nav_button() {
        self.navigationItem.title = "Flight \(userFlight.flightNum!)";
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "favorite"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(favoritebuttonPress), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.rightBarButtonItems = [item1]
        
    }
    
    @objc func favoritebuttonPress(_ sender: Any) {
        Favorites.favoritesList.append(userFlight)
        print(Favorites.favoritesList)
        self.performSegue(withIdentifier: "toFavorites", sender: self)
    }
 

}
