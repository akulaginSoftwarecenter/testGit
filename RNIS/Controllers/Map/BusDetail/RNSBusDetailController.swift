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
        
        let container = STRouter.scrollShowContainer(vc, topTitle: item?.title)
        
        container?.handlerRect = { rect in
            vc?.handlerRect?(rect)
        }
        vc?.startBottomOffset = container?.startBottomOffset
        
        return  container
    }
    
    var item: RNSBus?
    var startBottomOffset: CGFloat?
    var handlerRect: AliasRectBlock?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewTotal: RNSBusDetailTotalView!
    @IBOutlet weak var viewWay: RNSBusDetailWayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareItems()
        prepareTitle()
        observeRectContainer()
    }
    
    func prepareItems() {
        viewTotal.item = item
        viewWay.item = item
    }
    
    func prepareTitle() {
        titleLabel.text = item?.title
    }
    
    func observeRectContainer() {
        handlerRect = {[weak self] rect in
            print("rect",rect)
            print("startBottomOffset",self?.startBottomOffset ?? 0)
        }
    }
    
    override class var storyboardName: String {
        return "RNSBusDetailController"
    }
    
    deinit {
        print("RNSBusDetailController deinit")
    }
}
