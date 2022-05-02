//
//  MapViewController.swift
//  Maps
//
//  Created by Ирина on 23.04.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var annotationsArray = [MKPointAnnotation]()
    
    let mapView: MKMapView  = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    let addAddress: UIButton = {
        let addressButton = UIButton()
        addressButton.setTitle("ADD 3 ADDRESSES", for: .normal)
        addressButton.backgroundColor = .red.withAlphaComponent(0.5)
        addressButton.layer.cornerRadius = 10
        addressButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        
        return addressButton
    }()
    
    let resetButton: UIButton = {
        let resetButton = UIButton()
        resetButton.setTitle("RESET", for: .normal)
        resetButton.backgroundColor = .red.withAlphaComponent(0.5)
        resetButton.layer.cornerRadius = 10
        resetButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.isHidden = true
        
        return resetButton
    }()
    
    let routeButton: UIButton = {
        let routeButton = UIButton()
        routeButton.setTitle("ROUTE", for: .normal)
        routeButton.backgroundColor = .red.withAlphaComponent(0.5)
        routeButton.layer.cornerRadius = 10
        routeButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        routeButton.translatesAutoresizingMaskIntoConstraints = false
        routeButton.isHidden = true
        
        return routeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        
        addAddress.addTarget(self, action: #selector(addAddressButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        routeButton.addTarget(self, action: #selector(routeButtonTapped), for: .touchUpInside)
        setConstrainsButtons()
        
        mapView.delegate = self
    }
    
    @objc func addAddressButtonTapped() {
        alertAddAddress(title: "Add Address", placeholder: "Please enter address") { text in
            self.setupPlacemark(addressPlace: text)
        }
    }
    
    @objc func resetButtonTapped() {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        annotationsArray = [MKPointAnnotation]()
        routeButton.isHidden = true
        resetButton.isHidden = true
        
    }
    
    @objc func routeButtonTapped() {
        for index in 0...annotationsArray.count - 2 {
            createDirectionRequest(
                startCoordinate: annotationsArray[index].coordinate,
                destinationCoordinate: annotationsArray[index + 1].coordinate)
        }
        mapView.showAnnotations(annotationsArray, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .red
        
        return render
    }
}
