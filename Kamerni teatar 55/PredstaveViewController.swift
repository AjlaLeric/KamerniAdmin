//
//  PredstaveViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 25/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PredstaveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var showsData:[String] = []
    
    var handle:DatabaseHandle?

    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        handle = ref?.child("Shows").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String
            {
                self.showsData.append(item)
                self.tableView.reloadData()
            }
        })
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showcell")
        cell?.textLabel?.text = showsData[indexPath.row]
        return cell!
    }
}
