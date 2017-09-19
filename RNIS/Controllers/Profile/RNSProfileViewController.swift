//
//  RNSProfileViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSProfileViewController: UIViewController {
    
    @IBOutlet weak var nameField: RNSNameField!
    @IBOutlet weak var emailField: RNSEmailField!
    @IBOutlet weak var phoneField: RNSPhoneField!
    @IBOutlet weak var blackButton: RNSBlackButton!
    
    lazy var loaderView:LoaderView = {
        let view = LoaderView()
        view.labelText.text = "Обновление реквизитов"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        prepareBlackButton()
    }
    
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
    
    func loadData() {
        loaderView.showInView(self.view)
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.updateUI(reply as? RNSUserPayload)
            self?.loaderView.remove()
        }
    }
    
    func updateUI(_ item: RNSUserPayload?) {
        nameField.text = item?.name
        phoneField.text = item?.formatPhone
        emailField.text = item?.email
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
    
    deinit {
        print("RNSProfileViewController deinit")
    }
}
