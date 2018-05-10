//
//  DetailShowViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 16/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit


class DetailShowViewController: UIViewController {
    
    var index = 0
    var showName :String = ""
    var showDesc :String = ""
    
    /*
    var image = [UIImage(named: "rg"), UIImage(named: "ljup"), UIImage(named: "um"), UIImage(named:"kb")]
 */
    
    

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txtview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = showName
        txtview.text = showDesc
        
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     

}
