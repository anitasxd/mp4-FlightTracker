//
//  Info- Map.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

extension AirportInfoViewController: MKMapViewDelegate {
    func mapViewSetup(){
        mapView = MKMapView()
        mapView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height / 3)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.delegate = self
        
        LufthansaAPIClient.getAirportInfo(code: code!, completion: ({origin in
            let point = MKPointAnnotation()
            point.title = self.airportCode!
            point.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees((origin.airportLat! as NSString).integerValue), longitude: CLLocationDegrees((origin.airportLong! as NSString).integerValue))
            self.mapView.addAnnotation(point)
            
            var start = CLLocationCoordinate2D(latitude: CLLocationDegrees((origin.airportLat! as NSString).integerValue), longitude: CLLocationDegrees((origin.airportLong! as NSString).integerValue))
            self.view.addSubview(self.mapView)
            }))
  
        var mapRegion : MKCoordinateRegion  = MKCoordinateRegion()
        var coordinate :  CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordinate.latitude = 40.499998
        coordinate.longitude = 15.3833318
        mapRegion.center = coordinate
        mapRegion.span.latitudeDelta = 40
        mapRegion.span.longitudeDelta = 40
        mapView.setRegion(mapRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("In MKMapViewDelegate")
        let identifier = "marker"
        let view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            print("Created a new view")
            print(annotation.title)
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            
            let btn = UIButton(type: .detailDisclosure)
            view.rightCalloutAccessoryView = btn
        }
        return view
        
    }
    
    
    
}
