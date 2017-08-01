//
//  RNSPhoneContrainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneContrainerController: UIViewController {

    var enterViewController: RNSPhoneViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        enterViewController = segue.destination as? RNSPhoneViewController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        enterViewController?.titleTextTop = titleTextTop
        enterViewController?.handlerBlackAction = { [weak self] in
            self?.actionNext()
        }
    }
    
    var titleTextTop: String {
        return ""
    }
    
    var phoneText: String? {
       return enterViewController?.phoneField.last10
    }
    
    func actionNext() {
        
    }
    
    override class var storyboardName: String {
        return kPhoneVC
    }
}
