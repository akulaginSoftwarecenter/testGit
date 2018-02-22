//
//  DocsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер для отображения выбранного информационного раздела
 */
class DocsInfoViewController: UIViewController {

    /// переменная браузера
    @IBOutlet weak var webView: UIWebView!
    
    /// Надпись заголовка контроллера
    @IBOutlet weak var titleLabel: UILabel!
    lazy var loaderWay = RNSLoaderWay()
    /// Представление для отображения текста раздела
    //@IBOutlet weak var textView: UITextView!
    var type: RNSDocsType = .userGuide
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()

        loadText()
    }
    
    /// Загрузка текста раздела
    func loadText() {
        titleLabel.text = type.title
        
        RNSPostMobilePageGet(type, complete: { [weak self] (item) in
            self?.prepareText(item?.text)
            self?.clearError()
        }) { [weak self] error in
            self?.prepareError(error)
            self?.prepareText(nil)
        }
    }
    
    /// Метод загрузка html текста
    func prepareText(_ text: String?) {
        guard let text = text else {
            return
        }
        let page = String(format: "%@%@%@", "<div style=\"color:#ffffff\">", text, "</div>")
        webView.loadHTMLString(page, baseURL: nil)
    }
    
    /// Метод отображения ошибок
    func prepareError(_ text: String?) {
        loaderWay.showCenterError(self.view, frame: webView.frame, text: text)
    }
    
    /// Метод очистки ошибок
    func clearError() {
        loaderWay.remove()
    }

    /// Событие нажатия на кнопку возврата
    @IBAction func actionBack(_ sender: Any) {
        STRouter.pop()
    }
}
