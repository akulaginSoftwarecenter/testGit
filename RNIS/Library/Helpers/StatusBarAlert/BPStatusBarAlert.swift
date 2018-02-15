//
//  BPStatusBarAlert.swift
//  Pods
//
//  Created by Ben.Park on 2017. 1. 24..
//
//

import Foundation
import UIKit

public enum AlertPosition {
    case statusBar
    case navigationBar
}

public class BPStatusBarAlert: UIView {
    
    typealias Position = AlertPosition
    typealias Completion = () -> Void
    var handler:EmptyBlock?
    var containerWindow: UIWindow?
    
    var duration: TimeInterval
    var delay: TimeInterval
    var isShowing: Bool = false
    var position: Position
    var completion: Completion?
    
    var messageLable: UILabel = UILabel()
    var messageColor: UIColor = UIColor.white
    
    let statusBarHeight:CGFloat = 68
    let navigationBarHeight: CGFloat = 44.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            _ = make.edges.equalTo(self).inset(0)
        }
        return imageView
    }()
    
    @discardableResult init(_ message: String?, delay: TimeInterval = 3, handlerTap: EmptyBlock? = nil) {
        self.duration =  0.3
        self.delay = delay
        self.position = .statusBar
        self.completion = nil
        
        
        super.init(frame: CGRect.zero)
        
        self.handler = handlerTap
        backgroundColor = .color210
        cornerRadius = 10
        setupView(position: self.position)
        setupMessageLabel()
        messageLable.text = message
        addGestures()
        
        let button = UIButton()
        button.addTarget(self, action: #selector(actionTap), for: .touchUpInside)
        addSubview(button)
        button.snp.makeConstraints { (make) in
            _ = make.edges.equalTo(self).inset(0)
        }
        show()
    }
    
    func addGestures() {
        let  topSwipe =  UISwipeGestureRecognizer(target: self, action: #selector(actionSwipe))
        topSwipe.direction = .up
        addGestureRecognizer(topSwipe)
    }
    
    @objc func actionTap() {
        finishAnimating()
        self.handler?()
    }
    
    @objc func actionSwipe() {
        finishAnimating()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Extensions
extension UIColor {
    
    static var bgColor: UIColor {
        return UIColor(red: 77/255, green: 188/255, blue: 201/255, alpha: 1)
    }
}
