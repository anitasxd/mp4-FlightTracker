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
       
        LufthansaAPIClient.getAuthToken() {
        LufthansaAPIClient.getAllAirports(UIview: self, completion: ({airports in
                for element in airports {
                    let point = MKPointAnnotation()
                    point.title = "\(element.airportName!), \(element.airportCode!)"
                    point.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees((element.airportLat! as NSString).integerValue), longitude: CLLocationDegrees((element.airportLong! as NSString).integerValue))
                    self.mapView.addAnnotation(point)
                }
                self.view.addSubview(self.mapView)
            }))
        }
        print("done populating")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.selectedAirport = view.annotation as? MKPointAnnotation
        self.airportCode = selectedAirport?.title
        print(airportCode)
        
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
            btn.addTarget(self, action: #selector(airportInfoButton), for: .touchUpInside)
        }
        return view
        
    }
    
    @objc func airportInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "toAirportDetail", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AirportInfoViewController {
            destination.airportCode = airportCode
        }
    }
}

