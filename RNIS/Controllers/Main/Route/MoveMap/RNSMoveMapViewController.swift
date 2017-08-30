//
//  RNSMoveMapViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveMapViewController: UIViewController {
    
    var item: RNSRouteVariant?
    
    @IBOutlet weak var viewVariant: RNSDotsBussView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.updateRoads()
        print("RNSMoveMapViewController deinit")
    }
}
