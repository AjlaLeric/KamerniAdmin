//
//  CustomTableViewCell.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 10/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var mhlbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var mhimage: UIImageView!
   
    @IBOutlet weak var locName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
