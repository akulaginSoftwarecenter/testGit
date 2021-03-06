//
//  RNSNewsDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для отображения подробной информации новости
 */
class RNSNewsDetailController: UIViewController {
    
    /// главная переменная инициализации
    var item: RNSNewsTemp?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var anounceWebView: RNSNewsWebView!
    @IBOutlet weak var textWebView: RNSNewsWebView!
    @IBOutlet weak var heightImageView: NSLayoutConstraint!
    
    @IBOutlet weak var rectangleView: UIImageView!
    @IBOutlet weak var anonceLabel: UILabel!
    
    static func initController(_ item: RNSNewsTemp?) -> UIViewController? {
        let vc = RNSNewsDetailController.initialControllerType()
        vc?.item = item
        return STRouter.imageContainer(vc)
    }

    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItem()
    }
    
    func loadItem() {
        prepareTitle()
        prepareWebViews()
        loadImage()
    }
    
    func prepareTitle() {
        anonceLabel.text = item?.titleDate
    }
    
    func loadImage() {
        heightImageView.constant = 0
        Utils.loadImage(url: item?.image) { [weak self] image in
            self?.prepareImageView(image)
        }
    }
    
    func prepareImageView(_ image: UIImage?) {
        guard let image = image else {
            return
        }
        rectangleView.isHidden = false
        anonceLabel.isHidden = false
        let size = image.size
        let height = UIScreen.width * size.height/size.width
        heightImageView.constant = height
        imageView.image = image
    }
    
    func prepareWebViews() {
        anounceWebView.item = item?.anounce
        textWebView.item = item?.text
    }
}
