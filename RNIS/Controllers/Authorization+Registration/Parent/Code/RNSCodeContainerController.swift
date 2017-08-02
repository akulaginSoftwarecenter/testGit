//
//  RNSCodeContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCodeContainerController: UIViewController {
    
    var enterViewController: RNSCodeViewController?
    var phone: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        enterViewController = segue.destination as? RNSCodeViewController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        enterViewController?.titleTextTop = titleTextTop
        enterViewController?.handlerBlackAction = { [weak self] in
            self?.actionNext()
        }
        
        enterViewController?.handlerRepeatCode = { [weak self] in
            self?.repeatCodeAction()
        }
        enterViewController?.phone = phone
    }
    
    var titleTextTop: String {
        return ""
    }
    
    var codeText: String? {
        return enterViewController?.codeField.text
    }
    
    func actionNext() {
        
    }
    
    func repeatCodeAction() {
        
    }
    
    override class var storyboardName: String {
        return kCodeVC
    }
}
