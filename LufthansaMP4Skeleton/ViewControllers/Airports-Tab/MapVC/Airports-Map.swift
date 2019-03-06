//
//  Airports-UISetup.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension AirportsViewController: MKMapViewDelegate {
    func mapViewSetup(){
        mapView = MKMapView()
        mapView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.delegate = self
        
        var mapRegion : MKCoordinateRegion  = MKCoordinateRegion()
        var coordinate :  CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordinate.latitude = 40.499998
        coordinate.longitude = 15.3833318
        mapRegion.center = coordinate
        mapRegion.span.latitudeDelta = 50
        mapRegion.span.longitudeDelta = 50
        mapView.setRegion(mapRegion, animated: true)
        
        LufthansaAPIClient.getAllAirports(UIview: self, completion: ({airports in
                for element in airports {
                    let airport = MKPointAnnotation()
                    airport.title = "\(element.airportName!), \(element.airportCode!)"
                    airport.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees((element.airportLat! as NSString).integerValue), longitude: CLLocationDegrees((element.airportLong! as NSString).integerValue))
                    self.mapView.addAnnotation(airport)
                }
                self.view.addSubview(self.mapView)
            }))
        print("done populating")
    }
}
