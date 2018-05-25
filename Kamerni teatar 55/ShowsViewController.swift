//
//  ShowsViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ShowsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var showList = [ShowsModel]()
    
    var refShows: DatabaseReference!

   
    var ref:DatabaseReference?

    
    @IBOutlet weak var tableView: UITableView!
    
    
     let locationImage = [UIImage(named: "radnjanauglu"), UIImage(named: "ljupaf"), UIImage(named: "umrimuski"), UIImage(named:"kbng")]
    
   
    
       override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    
            addSlideMenuButton()
        
    
        refShows = Database.database().reference().child("shows");
        refShows.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.showList.removeAll()
                
                //iterating through all the values
                for shows in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let showObject = shows.value as? [String: AnyObject]
                    let showName  = showObject?["name"]
                    let showId  = showObject?["id"]
                    let showdesc = showObject?["description"]
                    
                    //creating artist object with model and fetched values
                    let artist = ShowsModel(id: showId as! String?, name: showName as! String?, description: showdesc as! String?)
                    
                    //appending it to list
                    self.showList.append(artist)
                }
                
                //reloading the tableview
                self.tableView.reloadData()
            }
        })
        
    }
    
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return showList.count
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let show: ShowsModel
        show = showList[indexPath.row]
        cell.locationName.text = show.name
        cell.locationDescription.text = show.description
        
        
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
     
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "predstavaprikaz"
        {
            
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let show = showList[indexPath.row]
                let destVC : DetailShowViewController = segue.destination as! DetailShowViewController
                destVC.showName = show.name!
                destVC.showDesc = show.description!
                destVC.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                destVC.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    func deleteShow(id: String)
    {
        refShows.child(id).setValue(nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let show = showList[indexPath.row]
            let id = show.id
            self.deleteShow(id: id!)
            tableView.reloadData()
        }
    }


    }






