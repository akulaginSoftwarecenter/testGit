//
//  RNSChangePhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangePhoneController: RNSPhoneContrainerController {
    
    override var typeTitle: TypeTitle {
        return .change
    }
    
    override var placeHolderPhoneField: String? {
        return "Введите новый номер телефона"
    }
    
    override var titleBackButton: String? {
        return "Назад"
    }
    
    var item: RNSUserPayload?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.item = reply as? RNSUserPayload
            STRouter.removeLoader()
        }
    }
    
    override func actionNext() {
        item?.new_phone = "+7" + (phoneText ?? "")
        item?.new_email = nil  // Don't re-send new email parameter on next update profile request
        RNSPostUpdate(item, complete: {
            RNSChangeCodeController.initController($0)?.pushAnimated()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    override func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
