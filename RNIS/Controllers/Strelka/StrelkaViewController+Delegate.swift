//
//  StrelkaViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки событий представления для демонстрации веб-страницы
extension StrelkaViewController: UIWebViewDelegate {
    public func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        loaderView.remove()
    }
}
