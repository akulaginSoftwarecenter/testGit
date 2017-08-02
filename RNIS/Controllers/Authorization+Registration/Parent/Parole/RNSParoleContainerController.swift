//
//  RNSParoleContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSParoleContainerController: UIViewController {

    var enterViewController: RNSParoleViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        enterViewController = segue.destination as? RNSParoleViewController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        enterViewController?.titleTextTop = titleTextTop
        enterViewController?.handlerBlackAction = { [weak self] in
            self?.actionNext()
        }
        enterViewController?.placeholderPassworOne = placeholderPassworOne
        enterViewController?.titleBlackButton = titleBlackButton
    }
    
    var titleTextTop: String {
        return ""
    }
    
    var passwordOne: String? {
        return enterViewController?.passwordOneField.text
    }
    
    var passwordTwo: String? {
        return enterViewController?.passwordTwoField.text
    }
    
    var placeholderPassworOne: String?  {
        return ""
    }
    
    var titleBlackButton: String? {
        return ""
    }
    
    func actionNext() {
        
    }
  
    override class var storyboardName: String {
        return kParoleVC
    }
}
