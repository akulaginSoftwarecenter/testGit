//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout

/**
 main Map ViewController
 */
class RNSMapViewController: UIViewController {
    
    /**
     base mapview PGView
     */
    lazy var mapView: MapView = {
        let mapView = MapView()
        mapView.startApplication()
        mapView.clearMapCache()
        mapView.setMapHost(mapHost)
        mapView.setTrafficMarksHost(mapHost)
        mapView.enterForeground()
        mapView.enableMyLocation()
        mapView.setMapRegime(1)
        let overlay = mapView.myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.delegate = self
        return mapView
    }()
    
    var presentViewController: UIViewController?
    
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    
    @IBOutlet weak var lightButton: RNSLightButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareLightButton()
        prepareHandlers()
        prepareStub()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLocation()
    }
    
    override class var storyboardName: String {
        return "RNSMapViewController"
    }
    
    func showBusStopIfNeed(_ overlay: PGOverlay) {
        guard let overlay = overlay as? RNSPinBusStop  else {
            return
        }
        let vc = RNSBusStopDetailController.initController(overlay.item)
        dismissPresent(vc)
    }
    
    func showBusIfNeed(_ overlay: PGOverlay) {
        guard let overlay = overlay as? RNSPinBus  else {
            return
        }
        let vc = RNSBusDetailController.initController(overlay.item)
        dismissPresent(vc)
    }
    
    deinit {
        print("RNSMapViewController deinit")
    }
}

