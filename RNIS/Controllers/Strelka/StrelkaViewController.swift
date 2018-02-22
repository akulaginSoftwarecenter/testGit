//
//  StrelkaViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер стрелки
 */
class StrelkaViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let host = "https://strelkacard.ru/"
    
    lazy var loaderView: LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadStart()
        prepareHandlers()
    }
    
    /// Загрузка страницы стрелки
    func loadStart() {
        loaderView.showInView(self.view)
        webView.loadRequest(URLRequest(url: URL(string: host)!))
    }
    
    /// Сброс страницы
    func resetIfNeed() {
        if host != webView.request?.url?.absoluteURL.absoluteString {
            loadStart()
        }
    }
    
    /// Настройка обработчика обновления страницы
    func prepareHandlers() {
        RNSMenuManager.handlerStrelkaUpdate = { [weak self] in
            self?.resetIfNeed()
        }
    }
}
