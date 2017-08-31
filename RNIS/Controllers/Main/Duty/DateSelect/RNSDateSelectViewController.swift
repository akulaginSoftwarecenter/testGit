//
//  RNSDateSelectViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDateSelectViewController: UIViewController {
    
    var handlerDate: ((Date?) -> ())?
    
    var handlerDismiss: EmptyBlock?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var oKButton: RNSBlackButton!
    @IBOutlet weak var cancelButton: RNSBlackButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    func prepareUI() {
        prepareButton()
        prepareDatePicker()
    }
    
    func prepareButton() {
        oKButton.handlerAction = {[weak self] in
            self?.handlerDate?(self?.datePicker.date)
            self?.dismiss()
        }
        
        cancelButton.handlerAction = {[weak self] in
            self?.dismiss()
        }
    }
    
    func dismiss() {
        handlerDismiss?()
        dismiss(animated: true)
    }
    
    func prepareDatePicker() {
        datePicker.minimumDate = Date()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    override class var storyboardName: String {
        return "RNSDateSelectViewController"
    }
    
    deinit {
        print("RNSDateSelectViewController deinit")
    }
}
