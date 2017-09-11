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

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var buttonDown: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareColor()
        
        prepareStub()
    }
    
    func prepareStub() {
        RNSPageRouteManager.prepareFirstNavel(523)
        
        item?.points.first?.doneMove = true
        viewVariant.item = item
    }
    
    func prepareColor() {
        buttonDown.backgroundColor = .F1645A
        viewTop.backgroundColor = .F1645A
    }
    
    var item: RNSRouteVariant? {
        return RNSPageRouteManager.currentItem
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
     
    deinit {
        RNSPageRouteManager.updateRoads()
        RNSPageRouteManager.prepareFirstNavel(nil)
    }
    
    @IBAction func actionDots(_ sender: Any) {
        RNSMoveDetailController.initController(item?.tableItem)?.pushAnimatedRed()
    }
}
