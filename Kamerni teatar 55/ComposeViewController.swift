//
//  ComposeViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 25/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ComposeViewController: UIViewController {
    
 
    var refShows: DatabaseReference!
    @IBOutlet weak var naslov: UITextField!


    @IBOutlet weak var opis: UITextField!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refShows = Database.database().reference().child("shows");
        

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addShow(_ sender: Any) {
        
       let key = refShows.childByAutoId().key
        
        let shows = ["id":key,
                     "name": naslov.text! as String,
                     "description": opis.text! as String
        ]
        refShows.child(key).setValue(shows)
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelShow(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)

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
