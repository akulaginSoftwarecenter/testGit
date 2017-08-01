//
//  RNSCodeViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCodeViewController: UIViewController {
    
    @IBOutlet weak var codeField: RNSTextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet var coverView: RNSLoginView!
    var handlerBlackAction: EmptyBlock?
    var handlerRepeatCode: EmptyBlock?
    var phone: String?
    
    @IBInspectable var titleTextTop: String?
    
    func prepareTitleTextTop() {
        guard let titleTextTop = titleTextTop else {
            return
        }
        coverView.titleTextTop = titleTextTop
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
        preparePhone()
    }
    
    func preparePhone() {
        phoneLabel.text = InputFieldsValidator.format(phone).text
    }
    
    func prepareCoverView() {
        prepareTitleTextTop()
        coverView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
    }
    
    func loginPressed() {
        if !codeField.isValid {
            codeField.setStateNotValid()
            errorLabel.text = "Введите код"
            return
        }
        clearError()
        handlerBlackAction?()
    }
    
    func clearError() {
        codeField.setStateValid()
        errorLabel.text = nil
    }
    
    @IBAction func repeatCodeAction(_ sender: Any) {
        handlerRepeatCode?()
    }
    
    override class var storyboardName: String {
        return kCodeVC
    }
}
