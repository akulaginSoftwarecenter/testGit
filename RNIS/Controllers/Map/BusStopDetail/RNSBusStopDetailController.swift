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
        let container = STRouter.scrollShowContainer(vc, topTitle: item?.title)
        container?.handlerRect = vc?.prepareViews(_:)
        vc?.startBottomOffset = container?.startBottomOffset
        return  container
    }
    
    var item: RNSBusStop?
    var items = [RNSBus]()
    lazy var loaderView:LoaderView = LoaderView()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleStop: UILabel!
    var startBottomOffset: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTitle()
        loadItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        prepareCurrent(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        prepareCurrent(false)
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
        let rect = CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height - 184)
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
    
    func prepareCurrent(_ value: Bool) {
        item?.handlerCurrent?(value)
    }
}
