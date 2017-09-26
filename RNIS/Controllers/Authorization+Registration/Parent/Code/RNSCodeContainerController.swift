//
//  RNSCodeContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCodeContainerController: STContainerViewController {
   
   var item: RNSUserPayload?
    
   var containerViewController: RNSCodeViewController? {
        return (enterViewController as? RNSCodeViewController)
   }
    
   var handlerUpdateScroll: ((CGFloat) -> ())?
    
   override func prepareEnterViewController(){
        super.prepareEnterViewController()
    
        containerViewController?.handlerRepeatCode = { [weak self] in
            self?.repeatCodeAction()
        }
        containerViewController?.phone = item?.phone
    }

    
    var codeText: String? {
        return containerViewController?.codeField.text
    }
    
    func repeatCodeAction() {
        item?.confirmSend()
    }
    
    override func actionNext() {
        item?.phone_activation_code = codeText
        RNSPostConfirmCheck(item, complete: { [weak self] item in
            self?.actionComplete(item)
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func actionComplete(_ item: RNSUserPayload?) {
        
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
    
    override class var storyboardName: String {
        return kCodeVC
    }
    
    deinit {
        NotificationCenter.removeObserver(self)
    }
}
