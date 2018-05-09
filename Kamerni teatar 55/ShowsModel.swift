//
//  ShowsModel.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 25/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import Foundation

class ShowsModel {
    
    var id: String?
    var name: String?
    var description: String?
    
    init(id: String?, name: String?, description: String?){
        self.id = id
        self.name = name
        self.description = description
    }
}
