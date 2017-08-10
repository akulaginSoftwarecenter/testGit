//
//  RNSBusStopDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopDetailController: UIViewController {
    
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    static func initController(_ item: RNSBusStop?) -> UIViewController? {
        let vc = RNSBusStopDetailController.initialController as? RNSBusStopDetailController
        vc?.item = item
        return  STRouter.scrollShowContainer(vc, topTitle: item?.title)
    }
    
    var item: RNSBusStop?
    var items = [RNSBus]()
    lazy var loaderView:LoaderView = LoaderView()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTitle()
        loadItems()
    }
    
    func loadItems() {
        showLoader()
        RNSDataManager.generateBusList { [weak self] (items) in
            self?.prepareItems(items)
            self?.loaderView.remove()
        }
    }
    
    func prepareItems(_ items: [RNSBus]) {
        self.items = items
        prepareTableView()
    }
    
    func showLoader() {
        let rect = CGRect(x: 0, y: 64, width: UIScreen.width, height: UIScreen.height - 184)
        loaderView.showInView(view, frame: rect)
    }
    
    func prepareTitle() {
        titleLabel.text = item?.title
    }
    
    override class var storyboardName: String {
        return "RNSBusStopDetailController"
    }
    
    deinit {
        print("RNSBusStopDetailController deinit")
    }
}
