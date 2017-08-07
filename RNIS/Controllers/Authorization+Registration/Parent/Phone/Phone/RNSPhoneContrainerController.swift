//
//  RNSPhoneContrainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneContrainerController: STContainerViewController {
    
    var containerViewController: RNSPhoneViewController? {
        return (enterViewController as? RNSPhoneViewController)
    }
    
    var phoneText: String? {
       return (enterViewController as? RNSPhoneViewController)?.phoneField.last10
    }
    
    var placeHolderPhoneField: String? {
        return nil
    }
    
    var titleBackButton: String? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         preparePhoneField()
         prepareBackButton()
    }
    
    func preparePhoneField() {
        guard let text = placeHolderPhoneField else {
            return
        }
        containerViewController?.phoneField.placeholderKey = text
    }
    
    func prepareBackButton() {
        guard let text = titleBackButton else {
            return
        }
        containerViewController?.backButton.title = text
    }
    
    override class var storyboardName: String {
        return kPhoneVC
    }
}
