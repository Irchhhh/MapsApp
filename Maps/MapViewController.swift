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
    
    let mapView: MKMapView  = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    let addAddress: UIButton = {
        let addressButton = UIButton()
        addressButton.setTitle("ADD ADRESS", for: .normal)
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
    }
    
    @objc func addAddressButtonTapped() {
        alertAddAddress(title: "Add Address", placeholder: "Please enter address") { text in
            print(text)
        }
    }
    
    @objc func resetButtonTapped() {
        print("reset")
    }
    
    @objc func routeButtonTapped() {
        print("route")
    }
}

extension MapViewController {
    
    func setConstraints() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func setConstrainsButtons() {
        mapView.addSubview(addAddress)
        NSLayoutConstraint.activate([
            addAddress.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50),
            addAddress.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            addAddress.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        mapView.addSubview(routeButton)
        NSLayoutConstraint.activate([
            routeButton.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            routeButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            routeButton.heightAnchor.constraint(equalToConstant: 50),
            routeButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        mapView.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            resetButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -30),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
