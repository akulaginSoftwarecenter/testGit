//
//  RNSCodeContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCodeContainerController: STContainerViewController {
   
   var containerViewController: RNSCodeViewController? {
        return (enterViewController as? RNSCodeViewController)
   }

   var phone: String?
    
   override func prepareEnterViewController(){
        super.prepareEnterViewController()
    
        containerViewController?.handlerRepeatCode = { [weak self] in
            self?.repeatCodeAction()
        }
        containerViewController?.phone = phone
    }

    
    var codeText: String? {
        return containerViewController?.codeField.text
    }
    
    func repeatCodeAction() {
        
    }
    
    override class var storyboardName: String {
        return kCodeVC
    }
}
