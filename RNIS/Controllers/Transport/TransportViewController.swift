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
    //@IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var favoritesBusView: RNSFavoritesBusView!
    @IBOutlet weak var myRoutesView: RNSTransportTableView!
    /*
    lazy var itemsBeside: [RNSBusStopTemp] = {
        let item1 = RNSBusStopTemp()
        item1.uuid = "0"
        item1.name = "Ленина"
        item1.forecast = [RNSRouteBusTemp("88",time: 2, timePerod: nil),
                          RNSRouteBusTemp("228",time: nil, timePerod: 20)]
        
        let item2 = RNSBusStopTemp()
        item2.uuid = "1"
        item2.name = "Пушкина"
        item2.forecast = [RNSRouteBusTemp("23",time: nil, timePerod: 5),
                          RNSRouteBusTemp("100",time: nil, timePerod: 20)]
        return [item1, item2]
    }()
    
    lazy var itemsFar: [RNSBusStopTemp] = {
        let item1 = RNSBusStopTemp()
        item1.uuid = "3"
        item1.name = "Ленина"
        item1.forecast = [RNSRouteBusTemp("288",time: nil, timePerod: 30)]
        return [item1]
    }()
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTitle()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 24.5)!,
                                                                        NSForegroundColorAttributeName : UIColor.white]
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        /*
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MyTransportTopCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportTopCell")
        self.tableView.register(UINib.init(nibName: "MyTransportCell", bundle: Bundle.main), forCellReuseIdentifier: "MyTransportCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
 */
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
