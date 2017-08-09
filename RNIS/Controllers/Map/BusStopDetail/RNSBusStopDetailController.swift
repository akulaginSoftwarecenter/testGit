//
//  RNSBusStopDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopDetailController: UIViewController {
    
    static func initController(_ item: RNSBusStop?) -> UIViewController? {
        let vc = RNSBusStopDetailController.initialController as? RNSBusStopDetailController
        vc?.item = item
        return STRouter.scrollShowContainer(vc)
    }
    
    var item: RNSBusStop?
    @IBOutlet weak var titleLabel: RNSTopTitle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepareTitle() {
        titleLabel.text = item?.title
    }
    
    override class var storyboardName: String {
        return "RNSBusStopDetailController"
    }
    
    deinit {
        print("RNSBusStopDetailController deinit")
    }
}
