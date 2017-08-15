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
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    var presentViewController: UIViewController?
    
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    
    @IBOutlet weak var lightButton: RNSLightButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RNSMapManager.prepareStub()
        prepareLightButton()
        RNSMapManager.startLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        print("viewWillAppear")
        prepareMapView()
        prepareHandlers()
    }
    
    override class var storyboardName: String {
        return "RNSMapViewController"
    }
    
    deinit {
        print("RNSMapViewController deinit")
    }
}

