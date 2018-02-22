//
//  URLRequest+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для URLRequest
 */
extension URLRequest {
    
    var isMail: Bool {
        return url?.isMail ?? false
    }
    
    func makeActionAt(_ navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == .linkClicked {
            if isMail {
                RNSInfoManager.shared.sendRequest(self)
            } else {
                UIApplication.shared.openURL(url!)
            }
            return false
        }
        return true
    }
}
