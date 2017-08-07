//
//  RNSPhoneViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneViewController: RNSCoverViewController,ContainerProtocol {

    @IBOutlet weak var phoneField: RNSPhoneField!
    @IBOutlet weak var backButton: RNSGrayBackButton!
    
    lazy var fields:[RNSTextField] = {
        return [self.phoneField]
    }()
    
    override func loginPressed() {
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        clearError()
        handlerBlackAction?()
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
    
    override class var storyboardName: String {
        return kPhoneVC
    }
}
