//
//  RNSNewsDetailController+WebView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSNewsDetailController: UIWebViewDelegate   {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.scrollView.isScrollEnabled = false
        heightWebView.constant = webView.scrollView.contentSize.height
    }
}
