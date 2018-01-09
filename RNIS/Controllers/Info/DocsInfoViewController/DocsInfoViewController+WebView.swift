//
//  DocsInfoViewController+WebView.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension DocsInfoViewController: UIWebViewDelegate  {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == .linkClicked {
            if request.isMail {
                RNSInfoManager.shared.sendRequest(request)
            } else {
                UIApplication.shared.openURL(request.url!)
            }
            return false
        }
        return true
    }
}
