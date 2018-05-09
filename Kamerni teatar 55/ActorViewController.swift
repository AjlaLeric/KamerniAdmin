//
//  ActorViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 18/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit

class ActorViewController: UIViewController {

    var index = 0
    var name = ["Emir Hadzihafizbegovic","Boris Ler", "Zana Marjanovic", "Muhamed Hadzovic", "Mirsad Tuka", "Dragan Jovicic", "Tatjana Sojic", "Vanesa Glodjo", "Fedja Stukan", "Aida Bukva", "Amar Selimovic", "Gordana Boban", "Jasna Ornela Bery", "Maja Izetbegovic", "Merima Ovcina-Smajovic", "Ravijojla Jovancic-Lesic", "Sabina Bambur", "Sadzida Setic", "Sasa Petrovic", "Senad Alihodzic"]
    
    var image = [UIImage(named: "Emir Hadzihafizbegovic"), UIImage(named: "Boris Ler"), UIImage(named: "Zana Marjanovic"), UIImage(named:"Muhamed Hadzovic"), UIImage(named:"Mirsad Tuka"), UIImage(named:"Dragan Jovicic"), UIImage(named:"Tatjana Sojic"), UIImage(named:"Vanesa Glodjo"), UIImage(named:"Fedja Stukan"), UIImage(named:"Aida Bukva"), UIImage(named:"Amar Selimovic"), UIImage(named:"Gordana Boban"), UIImage(named:"Jasna Ornela Bery"), UIImage(named:"Maja Izetbegovic"), UIImage(named:"Merima Ovcina-Smajovic"), UIImage(named:"Ravijojla Jovancic-Lesic"), UIImage(named:"Sabina Bambur"), UIImage(named:"Sadzida Setic"), UIImage(named:"Sasa Petrovic"), UIImage(named:"Senad Alihodzic"), ]
    
    var desc = [""]

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = name[index]
        img.image = image[index]
        textview.text = desc[index]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
