//
//  MapViewController + Constraints.swift
//  Maps
//
//  Created by Ирина on 27.04.2022.
//

import UIKit

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


