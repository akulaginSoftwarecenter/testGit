//
//  RNSPageRouteController.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteController: UIViewController {

    @IBOutlet weak var pageView: RNSPageRouteView!
    var containerController: RNSMapParentController?
    
    static func initController() -> UIViewController?  {
        return RNSPageRouteController.controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        //testNodes()
    }
    
    func testNodes() {
        let busNode = RNSNoteRoute(busTitle: "A86");
        view.addSubview(busNode)
        
        busNode.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        let timeNode = RNSNoteRoute(durationMinute: 5)
        view.addSubview(timeNode)
        
        timeNode.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(100)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.removeAllRoute()
        print("RNSPageRouteController deinit")
    }
}
