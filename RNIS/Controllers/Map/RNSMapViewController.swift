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
        mapView.myLocationOverlay()?.setBitmap(#imageLiteral(resourceName: "ic_userDirection"), xOffset: 0, yOffset: 0)
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
        STLocationManager.startLocation { [weak self] in
             self?.centerUserLocation()
        }
    }
    
    func centerUserLocation() {
        mapView.setMapCenter(STLocationManager.point)
        mapView.setZoomLevel(13)
    }
}

