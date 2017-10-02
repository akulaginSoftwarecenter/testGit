//
//  RNSAddressViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeAddress: String {
    case fromAddress = "Откуда"
    , inAddress = "Куда"
}

class RNSAddressViewController: UIViewController, KeyboardShowable {
    
    static func initController(_ item: RNSDutyAddressTemp?, type: TypeAddress?, complete: AliasAddressComplete?) -> UIViewController?  {
        let vc = RNSAddressViewController.controller as? RNSAddressViewController
        vc?.item = item
        vc?.type = type
        vc?.complete = complete
        return vc
    }
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomTableView
        }
    }
    
    var isNeedAddTap: Bool {
        return false
    }
    
    var type: TypeAddress?
    var item: RNSDutyAddressTemp?
    var complete: AliasAddressComplete?
    var containerController: RNSMapParentController?
    
    var pin: RNSPinAddress? 
    
    @IBOutlet weak var buttonMyLocation: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: RNSTopTitle!
    
    @IBOutlet weak var bottomTableView: NSLayoutConstraint!
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTextField()
        prepareType()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnOverlay = {[weak self] point,item in
            self?.onOverlay(point, item: item)
        }
    }
    
    func updateItem() {
        if item == nil {
            item = RNSDutyAddressTemp()
        }
        item?.address = text
        let point = pin?.point
        item?.latitude = point?.latitude
        item?.longitude = point?.longitude
    }
    
    func prepareType() {
        let type = self.type ?? .fromAddress
        titleLabel.text = type.rawValue
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
        print("RNSAddressViewController deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
        removePin()
    }
}
