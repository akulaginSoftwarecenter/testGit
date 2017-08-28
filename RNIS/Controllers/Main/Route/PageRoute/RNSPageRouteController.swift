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
        testNodes()
    }
    
    func testNodes() {
        let imageView = UIImageView()
        imageView.contentMode = .center
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(self.view)
        }
        let busNode = RNSNoteRoute(busTitle: "A86", type: .up)
        //imageView.image = busNode.asImage
        
        view.addSubview(busNode)
        
        let timeNode = RNSNoteRoute(durationMinute: 5, type: .down)
        imageView.image = timeNode.asImage

    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        RNSPageRouteManager.removeAllRoute()
        print("RNSPageRouteController deinit")
    }
}
