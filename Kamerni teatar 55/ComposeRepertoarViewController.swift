//
//  ComposeRepertoarViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 27/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ComposeRepertoarViewController: UIViewController {
    
    var moveID: Int = 0
    
    var dataFromFirst :String = ""
    
    @IBOutlet weak var btnSelect: UIButton!
    
    var refEvents:DatabaseReference!
    var ref:DatabaseReference?
    @IBOutlet weak var showSelected: UILabel!
    
    var showList = [ShowsModel]()
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
         refEvents = Database.database().reference().child("events");
        print(moveID)
        super.viewDidLoad()
        btnSelect.backgroundColor = .clear
        btnSelect.layer.cornerRadius = 5
        btnSelect.layer.borderWidth = 0.5
        btnSelect.layer.borderColor = UIColor.lightGray.cgColor
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        lblDate.text = formatter.string(from: datePicker.date)
        
        
        showSelected.text = dataFromFirst

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    @IBAction func dateSelectedFromDatepicker(_ :AnyObject)
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        lblDate.text = formatter.string(from: datePicker.date)
        
    }
        
    @IBAction func addEvent(_ sender: Any) {
        let key = refEvents.childByAutoId().key
        
        let events = ["id":key,
                      "name": showSelected.text! as String,
                      "date": lblDate.text! as String
        ]
        refEvents.child(key).setValue(events)
       
    }
    
    @IBAction func btnCancel(_ sender: Any) {
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
