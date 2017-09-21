//
//  RNSRouteDetailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteDetailController: UIViewController {
    
    @IBOutlet weak var flagView: RNSFlagButton!
    var item: RNSRouteVariant? {
        didSet {
            if detailView != nil {
                prepareDetailView()
            }
        }
    }
    
    var handlerBack: EmptyBlock?
    
    @IBOutlet weak var detailView: RNSRouteDetailView!
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    static func initController(_ item: RNSRouteVariant?) -> RNSRouteDetailController?  {
        let vc = RNSRouteDetailController.initialController as? RNSRouteDetailController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareDetailView()
        prepareFlagView()
    }
    
    func prepareDetailView() {
        detailView.item = item?.tableItem
    }
    
    override class var storyboardName: String {
        return "RNSRouteDetailController"
    }
    
    deinit {
        print("RNSRouteDetailViewController deinit")
    }
    
    @IBAction func actionBack(_ sender: Any) {
        handlerBack?()
    }
}
