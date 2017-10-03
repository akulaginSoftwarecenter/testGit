//
//  TransportViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class TransportViewController: UIViewController{

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var isNeedCheckToken = true
    
    @IBOutlet weak var titleLable: RNSTopTitle!
    @IBOutlet weak var favoritesBusView: RNSFavoritesBusView!
    @IBOutlet weak var myRoutesView: RNSTransportTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSegment()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateItemsIfNeed()
        checkToken()
    }
    
    func checkToken() {
        if isNeedCheckToken {
            isNeedCheckToken = false
            Utils.checkTokeShowAlert()
        }
    }

    override class var storyboardName: String {
        return "TransportViewController"
    }
}
