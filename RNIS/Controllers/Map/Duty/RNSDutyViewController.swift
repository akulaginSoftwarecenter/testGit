//
//  RNSDutyViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDutyViewController: UIViewController {

    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var viewLabelDate: UIView!
    @IBOutlet weak var rightDateConstraint: NSLayoutConstraint!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var inField: UITextField!
    @IBOutlet weak var searchButton: RNSBlackButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    var currentDate: Date?
    
    var fromItem: RNSDutyAddressTemp?
    var inItem: RNSDutyAddressTemp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSearchButton()
    }
    
    func loadData() {
        /*
        prepareError(nil)
        if fromItem?.address?.isEmpty ?? true {
            prepareError("Введите адрес отправления")
            return
        }
        
        if inItem?.address?.isEmpty ?? true {
            prepareError("Введите адрес назначения")
            return
        }
  */
        STRouter.showLoader()
        RNSPostActionRouting(fromItem, to: inItem, date: currentDate, complete: { items in
            RNSPageRouteManager.items = items
            RNSPageRouteController.controller.pushAnimated()
            STRouter.removeLoader()
        }, failure: { [weak self] text in
            self?.prepareError(text)
            STRouter.removeLoader()
        })
    }


    override class var storyboardName: String {
        return "RNSDutyViewController"
    }
    
    deinit {
        print("RNSDutyViewController deinit")
    }
}
