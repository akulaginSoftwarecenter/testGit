//
//  RNSDutyViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDutyViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var inField: UITextField!
    @IBOutlet weak var searchButton: RNSBlackButton!
    
    var fromText: String? {
        return fromField.text
    }
    
    var inText: String? {
        return inField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareDatePicker()
        prepareSearchButton()
    }
    
    func prepareSearchButton() {
        searchButton.handlerAction = {
            RNSPageRouteManager.generateItems()
            RNSPageRouteController.controller.pushAnimated()
        }
    }
    
    func prepareDatePicker() {
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    override class var storyboardName: String {
        return "RNSDutyViewController"
    }
    
    deinit {
        print("RNSDutyViewController deinit")
    }
}
