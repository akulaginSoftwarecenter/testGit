//
//  LoaderView.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 27.10.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

class LoaderView: RNSParentLoaderView {
    
    class var interactionEnabled: LoaderView {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }
}
