//
//  RNSDutyViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSDutyViewController
 */

class RNSDutyViewController: UIViewController {
    
    lazy var loaderView:LoaderView = LoaderView()

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

    override class var storyboardName: String {
        return "RNSDutyViewController"
    }
    
    deinit {
        print("RNSDutyViewController deinit")
    }
}
