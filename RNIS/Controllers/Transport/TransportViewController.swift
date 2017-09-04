//
//  TransportViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class TransportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        reloadTitle()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MyTransportTopCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportTopCell")
        self.tableView.register(UINib.init(nibName: "MyTransportCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.segmentControl.selectedSegmentIndex = 0
        self.segmentControlAction(self.segmentControl)
        
    }
    
    func reloadTitle() {
        self.navigationItem.title = titleSelected
    }
    
    override class var storyboardName: String {
        return "TransportViewController"
    }
}
