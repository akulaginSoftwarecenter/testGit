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
        generateStub()
    }
     
    func generateStub() {
        RNSPageRouteManager.generateItems()
        myRoutesView.updateUI()
    }
    
    override class var storyboardName: String {
        return "TransportViewController"
    }
}
