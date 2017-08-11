//
//  RNSBusDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusDetailController: UIViewController {
    
    static func initController(_ item: RNSBus?) -> UIViewController? {
        let vc = RNSBusDetailController.initialController as? RNSBusDetailController
        vc?.item = item
        return  STRouter.scrollShowContainer(vc, topTitle: item?.title)
    }
    
    var item: RNSBus?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewTotal: RNSBusDetailTotalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareItems()
        prepareTitle()
    }
    
    func prepareItems() {
        viewTotal.item = item
    }
    
    func prepareTitle() {
        titleLabel.text = item?.title
    }
    
    override class var storyboardName: String {
        return "RNSBusDetailController"
    }
    
    deinit {
        print("RNSBusDetailController deinit")
    }
}
