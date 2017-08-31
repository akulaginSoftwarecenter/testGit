//
//  RNSMoveMapViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveMapViewController: UIViewController {
    
    @IBOutlet weak var viewVariant: RNSDotsBussView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()

        viewVariant.item = RNSPageRouteManager.currentItem
    }
    
    var item: RNSRouteVariant? {
        return RNSPageRouteManager.currentItem
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.updateRoads()
        print("RNSMoveMapViewController deinit")
    }
    
    @IBAction func actionDots(_ sender: Any) {
        STRouter.showRouteDetail(item?.tableItem, hiddenMoveButton: true)
    }
}
