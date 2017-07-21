//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout
import SVProgressHUD

class RNSMapViewController: UIViewController {
    
    lazy var mapView: MapView = {
        let mapView = MapView()
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.startApplication()
        mapView.clearMapCache()
        mapView.setMapHost(mapHost)
        mapView.delegate = self
        mapView.setTrafficMarksHost(mapHost)
        mapView.enterForeground()
        mapView.enableMyLocation()
        mapView.setMapRegime(1)
        let overlay = mapView.myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        return mapView
    }()
    
    @IBOutlet weak var lightButton: RNSLightButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareLightButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLocation()
    }
    
    override class var storyboardName: String {
        return "RNSMapViewController"
    }
}

