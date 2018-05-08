//
//  EventsViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EventsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var repertoarList = [RepertoarModel]()
    
    var refShows: DatabaseReference!
    
    var ref:DatabaseReference?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
            addSlideMenuButton()
         refShows = Database.database().reference().child("events");
        
        refShows.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.repertoarList.removeAll()
                
                //iterating through all the values
                for events in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let showObject = events.value as? [String: AnyObject]
                    let showName  = showObject?["name"]
                    let showId  = showObject?["id"]
                    let showdate = showObject?["date"]
                    
                    //creating artist object with model and fetched values
                    let event = RepertoarModel(id: showId as! String?, name: showName as! String?, date: showdate as! String?)
                    
                    //appending it to list
                    self.repertoarList.append(event)
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return repertoarList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        let event: RepertoarModel
        event = repertoarList[indexPath.row]
      
        cell.eventName.text = event.name
        cell.eventDate.text = event.date
        
    return cell
}
}
