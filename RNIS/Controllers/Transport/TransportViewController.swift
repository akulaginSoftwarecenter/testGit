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
    
    @IBOutlet weak var favoritesBusView: RNSFavoritesBusView!
    @IBOutlet weak var myRoutesView: RNSTransportTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTitle()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

        self.segmentControl.selectedSegmentIndex = 0
        self.segmentControlAction(self.segmentControl)
        myRoutesView.generate()
     }
    
    func reloadTitle() {
        self.navigationItem.title = titleSelected
    }
    
    override class var storyboardName: String {
        return "TransportViewController"
    }
}
