//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout

class RNSMapViewController: UIViewController {
    
    lazy var mapView: MapView = {
        let mapView = MapView()
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.startApplication()
        mapView.clearMapCache()
        //mapView.setMapHost("http://95.213.205.92/")
        //mapView.setTrafficMarksHost("http://95.213.205.92/")
        mapView.enterForeground()
        mapView.enableMyLocation()
        let overlay = mapView.myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
    }
    
    func prepareMapView() {
        mapView.enableCompass()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLocation()
    }
    
    func startLocation() {
        RNSLocationManager.startLocation { [weak self] in
             self?.centerUserLocation()
        }
    }
    
    func centerUserLocation() {
        mapView.setMapCenter(RNSLocationManager.point)
        mapView.setZoomLevel(13)
    }
}

