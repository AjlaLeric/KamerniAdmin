//
//  ViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: BaseViewController {

    @IBOutlet weak var webView: UIWebView!
   
    override func viewDidLoad() {
        let fileURL = NSURL(fileURLWithPath: "/Users/mini6/Desktop/Kamerni-Admin/Kamerni teatar 55/KamerniClip.mp4")
        
        
      webView.loadHTMLString("<iframe width = \" \(self.webView.frame.width) \" height = \" \(self.webView.frame.height)\" src = \"\(fileURL)\"> </iframe>", baseURL: nil)
        super.viewDidLoad()
            addSlideMenuButton()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

