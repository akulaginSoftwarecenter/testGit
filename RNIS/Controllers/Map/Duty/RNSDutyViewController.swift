//
//  RNSDutyViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDutyViewController: UIViewController {

    @IBOutlet weak var viewLabelDate: UIView!
    @IBOutlet weak var rightDateConstraint: NSLayoutConstraint!
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
        
        prepareSearchButton()
    }

    override class var storyboardName: String {
        return "RNSDutyViewController"
    }
    
    deinit {
        print("RNSDutyViewController deinit")
    }
}
