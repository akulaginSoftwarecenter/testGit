//
//  SupportInfoViewController+LoadData.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension SupportInfoViewController {
    
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            STRouter.removeLoader()
            self?.updateUI(reply as? RNSUserPayload)
        }
    }
    
    func updateUI(_ item: RNSUserPayload?) {
        contactField.text = item?.email
    }
}
