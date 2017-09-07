//
//  RNSRegistrationNameController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationNameController: UIViewController {
    
    @IBOutlet weak var nameField: RNSTextField!
    @IBOutlet var coverView: RNSLoginView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var item: RNSRegisterPayload?
    
    static func initController(_ item: RNSRegisterPayload?) -> UIViewController? {
        let vc = RNSRegistrationNameController.initialController as? RNSRegistrationNameController
        vc?.item = item
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.buttonPressed()
        }
    }
    
    func buttonPressed() {
        if !nameField.isValid {
            nameField.setStateNotValid()
            errorLabel.text = "Введите имя"
            return
        }
        clearError()
        //STRouter.showLogin()
    }
    
    func clearError() {
        nameField.setStateValid()
        errorLabel.text = nil
    }
   
    override class var storyboardName: String {
        return "RNSRegistrationNameController"
    }
}
