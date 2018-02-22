//
//  BaseViewWithXIBInit.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 31.08.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit
import PureLayout

/**
 Базовый класс для инициализации UIView из xib
 */
class BaseViewWithXIBInit: UIView {
    
    /// Названия xib файла
    var nibNamed:String {
        return String(describing: type(of: self))
    }
    
    /// Метод инициализации класса
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNibView()
    }
    
    /// Метод инициализации класса
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    /// Метод инициализации класса
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibView()
    }
    
    /// Метод загрузки вью из xib
    func loadNibView() {
        let nibView = UINib(nibName: nibNamed, bundle: nil).instantiate(withOwner: self, options: nil)[0]
        self.insertSubview(nibView as! UIView, at: 0)
        let _ = (nibView as AnyObject).autoPinEdgesToSuperviewEdges()
    }
}
