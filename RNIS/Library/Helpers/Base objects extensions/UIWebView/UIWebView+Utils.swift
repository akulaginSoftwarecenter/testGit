//
//  UIWebView+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для UIWebView
 */
extension UIWebView {
    func loadStubWhite(_ text: String?) {
        guard let text = text else {
            return
        }
        let page = String(format: "%@%@%@", "<div style=\"color:#ffffff\">", text, "</div>")
        loadHTMLString(page, baseURL: nil)
    }
}
