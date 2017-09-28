//
//  RNSParoleContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSParoleContainerController: STContainerViewController {

    var item: RNSUserPayload?
    
    var containerViewController: RNSParoleViewController? {
        return (enterViewController as? RNSParoleViewController)
    }
    
    override func prepareEnterViewController(){
        super.prepareEnterViewController()
        
        containerViewController?.placeholderPassworOne = placeholderPassworOne
        containerViewController?.titleBlackButton = titleBlackButton
    }
    
    var passwordOne: String? {
        return containerViewController?.passwordOneField.text
    }
    
    var passwordTwo: String? {
        return containerViewController?.passwordTwoField.text
    }
    
    var placeholderPassworOne: String?  {
        return ""
    }
    
    var titleBlackButton: String? {
        return ""
    }
    
    override func actionNext() {
        item?.password = passwordOne
        actionComplete(item)
    }
    
    func actionComplete(_ item: RNSUserPayload?) {
        
    }
  
    override class var storyboardName: String {
        return kParoleVC
    }
}
