//
//  RNSMoveDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSMoveDetailController
 */

class RNSMoveDetailController: UIViewController {
    
    var handlerBack: EmptyBlock?
    
    var item: RNSRouteVariant?
    @IBOutlet weak var flagView: RNSFlagButton!
    
    @IBOutlet weak var detailView: RNSRouteDetailView!
    
    static func initController(_ item: RNSRouteVariant?) -> RNSMoveDetailController?  {
        let vc = RNSMoveDetailController.initialController as? RNSMoveDetailController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.showMove = true
        updateItem()
        prepareFlagView()
        prepareObservers()
    }
    
    func prepareObservers() {
        NotificationCenter.addObserverLocation(self, selector: #selector(updateItem))
    }
    
    @objc func updateItem() {
        if detailView == nil {
            return
        }
        detailView.item = item?.tableItem
    }
    
    override class var storyboardName: String {
        return "RNSMoveDetailController"
    }
    
    @IBAction func actionBack(_ sender: Any) {
        handlerBack?()
    }
    
    deinit {
        print("RNSMoveDetailController deinit")
        NotificationCenter.removeObserver(self)
    }
}
