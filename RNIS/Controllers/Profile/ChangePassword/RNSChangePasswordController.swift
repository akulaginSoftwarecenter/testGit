//
//  RNSChangePasswordController.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangePasswordController: UIViewController {

    @IBOutlet var coverView: RNSLoginView!
    @IBOutlet weak var passwordOldField: STPasswordField!
    @IBOutlet weak var passwordOneField: STPasswordField!
    @IBOutlet weak var passwordTwoField: STPasswordField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
    func prepareCoverView() {
        coverView.handlerBlackAction = {
            //STRouter.pop()
        }
    }
}
