//
//  Storage.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 08/05/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import Foundation

class Storage {
    
    static let shared: Storage = Storage()
    
    var objects: [ShowsModel]
    
    private init()
    {
        objects = [ShowsModel]()
        
    }
    
    
    
}
