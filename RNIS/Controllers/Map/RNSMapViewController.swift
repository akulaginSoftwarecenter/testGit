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
        let mapView = RNSMapManager.mapView
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.delegate = self
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

