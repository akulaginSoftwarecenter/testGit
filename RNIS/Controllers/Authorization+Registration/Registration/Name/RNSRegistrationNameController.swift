//
//  RNSRegistrationNameController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper

class RNSRegistrationNameController: UIViewController {
    
    @IBOutlet weak var nameField: RNSTextField!
    @IBOutlet var coverView: RNSLoginView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var photo: RNSProfilePhoto!
    var handlerUpdateScroll: ((CGFloat) -> ())?
    var item: RNSUserPayload?

    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRegistrationNameController.initialController as? RNSRegistrationNameController
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
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
            prepareError("Введите имя")
            return
        }
        clearError()
        send()
    }
    
    func send() {
        item?.name = nameField.text
        item?.avatar = photo.imageData

        RNSPostUpdate(item, complete: {[weak self] _ in
            self?.login()
            }, failure: { [weak self] error in
                self?.prepareError(error)
        })
    }
    
    func login() {
        STRouter.showLoader()
        RNSPostLogin(item?.phone, password: item?.password, complete: {
            STRouter.removeLoader()
            STRouter.popToRoot()
            RNSMenuManager.leftMenuUpdate()
            }, failure: {[weak self] (errorText) in
                STRouter.removeLoader()
                self?.prepareError(errorText)
        })
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        nameField.setStateValid()
        prepareError(nil)
    }
   
    override class var storyboardName: String {
        return "RNSRegistrationNameController"
    }
}
