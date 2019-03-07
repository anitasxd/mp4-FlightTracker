//
//  FlightInfo-Map.swift
//  LufthansaMP4Skeleton
//
//  Created by Anita Shen on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

extension FlightInfoViewController: MKMapViewDelegate {
    func mapSetup() {
        mapView = MKMapView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height / 2 - 30))
        mapView.setUserTrackingMode(.follow, animated: true)
        
        LufthansaAPIClient.getAirportInfo(code: userFlight.originAirport!, completion: ({origin in
            var start = CLLocationCoordinate2D(latitude: CLLocationDegrees((origin.airportLat! as NSString).integerValue), longitude: CLLocationDegrees((origin.airportLong! as NSString).integerValue))
            
            LufthansaAPIClient.getAirportInfo(code: self.userFlight.destinationAirport!, completion: ({destination in
                
                var end = CLLocationCoordinate2D(latitude: CLLocationDegrees((destination.airportLat! as! NSString).integerValue), longitude:CLLocationDegrees((destination.airportLong! as! NSString).integerValue))
                let locations = [start, end]
                let sourcePlacemark = MKPlacemark(coordinate: start, addressDictionary: nil)
                let destinationPlacemark = MKPlacemark(coordinate: end, addressDictionary: nil)
                
                let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
                let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                
                let sourceAnnotation = MKPointAnnotation()
                if let location = sourcePlacemark.location {
                    sourceAnnotation.coordinate = location.coordinate
                }
    
                let destinationAnnotation = MKPointAnnotation()
                
                if let location = destinationPlacemark.location {
                    destinationAnnotation.coordinate = location.coordinate
                }
                self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
                let line = MKPolyline(coordinates: locations, count: locations.count)
                self.mapView.addOverlay(line)
                self.view.addSubview(self.mapView)
            
            }))
            
        }))
        
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
            //btn.addTarget(self, action: #selector(airportInfoButton), for: .touchUpInside)
        }
        return view
        
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if (overlay is MKPolyline) {
            let polylineRender = MKPolylineRenderer(overlay: overlay)
            polylineRender.strokeColor = UIColor.blue.withAlphaComponent(0.5)
            polylineRender.lineWidth = 5
            return polylineRender
        }
        return MKOverlayRenderer()
    }
}
