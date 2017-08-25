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

    var containerController: RNSMapParentController?
     
    var presentViewController: UIViewController?
    
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RNSMapManager.prepareStub()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        prepareHandlers()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }

    deinit {
        print("RNSMapViewController deinit")
    }
}

