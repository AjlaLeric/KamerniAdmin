//
//  PopOverViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 27/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase



class PopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objects = [Any]()
    var showList = [ShowsModel]()
    
    var refShows: DatabaseReference!
    
    @IBOutlet weak var PopUpView: UIView!
    var ref:DatabaseReference?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
          super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        refShows = Database.database().reference().child("shows");
        refShows.observe(DataEventType.value, with: { (snapshot) in

       if snapshot.childrenCount > 0 {
        self.showList.removeAll()
        for shows in snapshot.children.allObjects as! [DataSnapshot] {
            //getting values
            let showObject = shows.value as? [String: AnyObject]
            let showName  = showObject?["name"]
            let showId  = showObject?["id"]
            let showdesc = showObject?["description"]
            let artist = ShowsModel(id: showId as! String?, name: showName as! String?, description: showdesc as! String?)
            
            //appending it to list
            self.showList.append(artist)
        }
        
        //reloading the tableview
        self.tableView.reloadData()
            }
        })
        PopUpView.layer.cornerRadius = 10
        PopUpView.layer.masksToBounds = true

      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for:indexPath)
        as! CustomTableViewCell
        let show: ShowsModel
        show = showList[indexPath.row]
        cell1.locName.text = show.name
        
       return cell1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IdiNazad"
        {

        if let indexPath = self.tableView.indexPathForSelectedRow
       {
        let show = showList[indexPath.row]
      
        let destVC : ComposeRepertoarViewController = segue.destination as! ComposeRepertoarViewController
        destVC.dataFromFirst = show.name!
        destVC.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        destVC.navigationItem.leftItemsSupplementBackButton = true
    }
    }
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
