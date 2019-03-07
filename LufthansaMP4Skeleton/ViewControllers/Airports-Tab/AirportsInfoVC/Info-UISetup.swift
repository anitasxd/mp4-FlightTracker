//
//  Info-UISetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit

extension AirportInfoViewController {
    
    func uiSetup(){
        init_nav_button()
        segmentControlSetup()
        tableViewSetup()
    }
    
    func init_nav_button() {
        self.navigationItem.title = airportCode;
    }
    
    func segmentControlSetup(){
        segmentControl = UISegmentedControl(frame: CGRect(x: 0, y: mapView.frame.maxY, width: view.frame.width, height: 40))
        segmentControl.insertSegment(withTitle: "Departures", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "Arrivals", at: 1, animated: false)
        segmentControl.selectedSegmentIndex = 0

        view.addSubview(segmentControl)
    }
    
    @objc func switchView(){
        if segmentControl.selectedSegmentIndex == 0{
            //tableViewSetup()
        }
        else{
            //collectionViewSetup()
        }
        
    }
    
    func tableViewSetup(){
        flightsTable = UITableView(frame: CGRect(x:0, y: segmentControl.frame.maxY, width: view.frame.width , height: (view.frame.height / 3) * 2))
        flightsTable.register(InfoTableCell.self, forCellReuseIdentifier: "airPortsFlights")
        flightsTable.delegate = self
        flightsTable.dataSource = self
        flightsTable.rowHeight = view.frame.height / 3
        self.view.addSubview(flightsTable)
    }
    
    
}
