//
//  CloudKitAPI.swift
//  Day
//
//  Created by Alexander Kozin on 03.06.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import CloudKit


class CloudKitAPI: API {
    let container = CKContainer.default()
    
    var publicCloudDatabase: CKDatabase {
        return container.publicCloudDatabase
    }
}
