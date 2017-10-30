//
//  RNSNewsDetailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSNewsDetailController: UIViewController {
    
    var item: RNSNewsTemp?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var heightWebView: NSLayoutConstraint!
    @IBOutlet weak var heightImageView: NSLayoutConstraint!
    
    @IBOutlet weak var rectangleView: UIImageView!
    @IBOutlet weak var anonceLabel: UILabel!
    
    static func initController(_ item: RNSNewsTemp?) -> UIViewController? {
        let vc = RNSNewsDetailController.initialController as? RNSNewsDetailController
        vc?.item = item
        return STRouter.imageScrollContainer(vc)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItem()
    }
    
    func loadItem() {
        prepareTitle()
        prepareWebView()
        loadImage()
    }
    
    func prepareTitle() {
        anonceLabel.text = item?.title
    }
    
    func loadImage() {
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
    
    func prepareWebView() {
        guard let text = item?.text else {
            return
        }
        let page = String(format: "%@%@%@", "<div style=\"color:#ffffff\">", text, "</div>")
        webView.loadHTMLString(page, baseURL: nil)
    }
    
    override class var storyboardName: String {
        return "RNSNewsDetailController"
    }
}
