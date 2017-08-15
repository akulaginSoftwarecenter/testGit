//
//  STRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

extension STRouter {
    
    static func showMap() {
        pushAnimated(RNSMapViewController.controller)
    }
    
    static func showLogin() {
        clearNav()
        push(imageBoardContainer(RNSLoginViewController.controller))
    }
    
    static func showAlertRepeatCode() {
        showAlert("Код выслан повторно")
    }
    
    static func showAlert(_ message: String?) {
        let vc = RNSAlertViewController.controller(message)
        present(vc, animated: false)
    }
}
