//
//  RNSFlagButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSFlagButton: BaseViewWithXIBInit {
    
    var handlerUpdate: EmptyBlock?
    
    lazy var loaderView = LoaderView()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var filled: Bool = false {
        didSet {
            imageView.image = filled ? #imageLiteral(resourceName: "flagFill") : #imageLiteral(resourceName: "flagClear")
            removeLoader()
        }
    }
    
    @IBAction func actionButton(_ sender: Any) {
        handlerUpdate?()
        showLoader()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareConstraint()
    }
    
    func showLoader() {
        loaderView.showInView(imageView)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
    
    func prepareConstraint() {
        guard let view = superview else {
            return
        }
        snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(97)
            make.top.right.equalTo(view)
        }
    }
}
