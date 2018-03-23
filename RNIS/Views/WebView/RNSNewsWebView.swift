//
//  RNSWebView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс отображения браузера для новости
 */
class RNSNewsWebView: BaseViewWithXIBInit, UIWebViewDelegate  {

    /// главная переменная строки поиска
    var item: String? {
        didSet {
            updateItem()
        }
    }
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var heightWebView: NSLayoutConstraint!
    
    func updateItem() {
        guard let item = item else {
            return
        }
        let page = String(format: "%@%@%@", "<div style=\"color:#ffffff\">", item, "</div>")
        webView.loadHTMLString(page, baseURL: nil)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.scrollView.isScrollEnabled = false
        heightWebView.constant = webView.scrollView.contentSize.height
    }
    
    /// Метод делегата браузера старта загрузки url
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return request.makeActionAt(navigationType)
    }
}
