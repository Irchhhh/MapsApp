//
//  MapViewController + ButtonsLogic.swift
//  Maps
//
//  Created by Ирина on 27.04.2022.
//

import Foundation
import CoreLocation
import MapKit

extension MapViewController {
    
    func setupPlacemark(addressPlace: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressPlace) { [self] placemarks, error in
            
            if let error = error {
                print(error)
                errorAlert(title: "Error", message: "Server is not available.Try adding the address again")
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            let annotation = MKPointAnnotation()
            annotation.title = addressPlace
            
            guard let placemarkLocation = placemark?.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            
            annotationsArray.append(annotation)
            
            if annotationsArray.count > 2 {
                routeButton.isHidden = false
                resetButton.isHidden = false

            }
            
            mapView.showAnnotations(annotationsArray, animated: true)
        }
    }
    
    func createDirectionRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destinationCoordinate = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destinationCoordinate)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let direction = MKDirections(request: request)
        direction.calculate { response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response else {
                self.errorAlert(title: "Error", message: "Route unavailable")
                return
            }
            
            var minRoute = response.routes[0]
            for route in response.routes {
                minRoute = (route.distance < minRoute.distance) ? route : minRoute
            }
            
            self.mapView.addOverlay(minRoute.polyline)
        }
    }
}
