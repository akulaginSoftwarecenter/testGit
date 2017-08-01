//
//  RNSRegistrationPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationPhoneController: UIViewController {
    
    var enterViewController: RNSPhoneViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        enterViewController = segue.destination as? RNSPhoneViewController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        enterViewController?.titleTextTop = kRegistration
        enterViewController?.handlerBlackAction = { [weak self] in
            print("RNSRegistrationPhoneController handlerBlackAction")
        }
    }
    
    override class var storyboardName: String {
        return "RNSPhoneViewController"
    }
}
