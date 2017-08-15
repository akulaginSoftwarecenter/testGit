//
//  RNSMapParentController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapParentController: UIViewController {

    /**
     base mapview PGView
     */
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    var handlerOnMapEvent: EmptyBlock?
    var handlerOnMapTouchEvent: AliasPointBlock?
    var handlerOnMapLongTouchEvent: AliasPointBlock?
    var handlerOnOverlay: ((PGOverlay,PGOverlayItem) -> ())?
    
    @IBOutlet weak var lightButton: RNSLightButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RNSMapManager.startLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareMapView()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        print("RNSMapParentController deinit")
    }
}
