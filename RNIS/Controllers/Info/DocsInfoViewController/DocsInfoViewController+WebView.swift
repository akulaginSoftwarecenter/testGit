//
//  DocsInfoViewController+WebView.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с бразуером
 */
extension DocsInfoViewController: UIWebViewDelegate  {
    
    /// Метод делегата старта загрузки url
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return request.makeActionAt(navigationType)
    }
}
