//
//  RNSBusInfoViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusInfoViewController: UIViewController {
    
    static func initController(_ item: RNSBus?) -> UIViewController? {
        let vc = RNSBusInfoViewController.initialController as? RNSBusInfoViewController
        vc?.item = item
        return  vc
    }
    
    var item: RNSBus?
    
    @IBOutlet weak var driverField: RNSNameFieldLeft!
    @IBOutlet weak var conductorField: RNSNameFieldLeft!
    @IBOutlet weak var depoField: RNSNameFieldLeft!
    @IBOutlet weak var carrierField: RNSNameFieldLeft!
    @IBOutlet weak var phoneField: RNSNameFieldLeft!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    func prepareUI() {
        driverField.text = item?.driver
        conductorField.text = item?.conductor
        depoField.text = item?.depo
        carrierField.text = item?.carrier
        phoneField.text = item?.phone
    }
    
    override class var storyboardName: String {
        return "RNSBusInfoViewController"
    }
}
