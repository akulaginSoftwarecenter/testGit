//
//  RNSPhoneViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneViewController: UIViewController {

    @IBOutlet var coverView: RNSLoginView!
    var handlerBlackAction: EmptyBlock?
    @IBInspectable var titleTextTop: String?
    @IBOutlet weak var phoneField: RNSPhoneField!
    @IBOutlet weak var errorLabel: UILabel!
    
    func prepareTitleTextTop() {
        guard let titleTextTop = titleTextTop else {
            return
        }
        coverView.titleTextTop = titleTextTop
    }
    
    lazy var fields:[RNSTextField] = {
        return [self.phoneField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
    func prepareCoverView() {
        prepareTitleTextTop()
        coverView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
    }
    
    func loginPressed() {
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
