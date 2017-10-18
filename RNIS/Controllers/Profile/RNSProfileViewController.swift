//
//  RNSProfileViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSProfileViewController
 */

class RNSProfileViewController: UIViewController {
    
    @IBOutlet weak var nameField: RNSNameField!
    @IBOutlet weak var emailField: RNSEmailField!
    @IBOutlet weak var phoneField: RNSPhoneField!
    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var profilePhoto: RNSProfilePhoto!
    
    var item: RNSUserPayload?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        prepareBlackButton()
        prepareProfilePhoto()
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerClearProfile = {[weak self] in
            self?.clearAll()
        }
    }
    
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    func clearAll() {
        profilePhoto.imageView.image = nil
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        errorLabel.text = ""
    }
    
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.updateUI(reply as? RNSUserPayload)
            STRouter.removeLoader()
        }
    }
    
    func updateUI(_ item: RNSUserPayload?) {
        self.item = item
        nameField.text = item?.name
        phoneField.text = item?.formatPhone
        emailField.text = item?.email
        self.item?.new_email = nil  // Remove new_email from update profile payload
        decodeImage()
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
    
    deinit {
        print("RNSProfileViewController deinit")
    }
}
