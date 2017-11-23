//
//  RNSParentLoaderView.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSParentLoaderView: BaseViewWithXIBInit {
    convenience init(_ delay: TimeInterval = 0) {
        self.init()
        
        self.delay = delay
    }
    @IBOutlet weak var labelText: UILabel!
    
    var defaultAlpha = CGFloat(0.3)
    var delay: TimeInterval = 0
    
    func showInView(_ view: UIView?) {
        addShowInView(view)
        self.autoPinEdgesToSuperviewEdges()
        animationShow()
    }
    
    func showInView(_ view: UIView?, frame: CGRect) {
        addShowInView(view)
        self.frame = frame
        animationShow()
    }
    
    func addShowInView(_ view: UIView?) {
        guard isEmptySuperView,
            let view = view else {
                return
        }
        view.addSubview(self)
    }
    
    func animationShow() {
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveLinear, animations: {[weak self] in
            self?.alpha = self?.defaultAlpha ?? 0.3
            }, completion:nil)
    }
    
    var isEmptySuperView: Bool{
        return superview == nil
    }
    
    func remove() {
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            self?.alpha = 0
            }, completion: { [weak self] (_) in
                self?.removeFromSuperview()
        })
    }
    
    
    func prepareText(_ text: String?) {
        labelText.text = text
    }
}
