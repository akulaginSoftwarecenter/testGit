//
//  NewsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 NewsViewController
 */

class NewsViewController: UIViewController, UIWebViewDelegate  {

    @IBOutlet weak var webView: UIWebView!
    let host = "https://dev-rnisportal.regeora.ru/"
    
    lazy var loaderView: LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStart()
        prepareHandlers()
    }
    
    func loadStart() {
        loaderView.showInView(self.view)
        webView.loadRequest(URLRequest(url: URL(string: host)!))
    }
    
    func resetIfNeed() {
        if host != webView.request?.url?.absoluteURL.absoluteString {
            loadStart()
        }
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerNewsUpdate = { [weak self] in
            self?.resetIfNeed()
        }
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        loaderView.remove()
    }

    override class var storyboardName: String {
        return "NewsViewController"
    }
}
