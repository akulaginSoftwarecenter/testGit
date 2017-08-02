//
//  RNSAlertViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSAlertViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    static func initController(_ message: String?) -> UIViewController? {
        let vc = RNSAlertViewController.initialController as? RNSAlertViewController
        vc?.message = message
        return vc
    }
    
    var message: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = message
    }
    
    override class var storyboardName: String {
        return "RNSAlertViewController"
    }
    @IBAction func actionOk(_ sender: Any) {
        dismiss(animated: false)
    }
}
