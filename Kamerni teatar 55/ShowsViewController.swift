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

class ShowsViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    var showList = [ShowsModel]()
    
    var refShows: DatabaseReference!
   
    var ref:DatabaseReference?

    
    @IBOutlet weak var collectionView: UICollectionView!
    
     let locationImage = [UIImage(named: "radnjanauglu"), UIImage(named: "ljupaf"), UIImage(named: "umrimuski"), UIImage(named:"kbng")]
    /**
    let locationName  =  ["Radnja na uglu", "Ljupaf", "Umri muski", "Kad bi naglas govorili"]
    
   
    
    var name = ["rg", "ljup", "um", "kb"]
    
    var ime = ["Radnja na uglu", "Ljupaf", "Umri muski", "Kad bi naglas govorili"]
    
    var desc = ["Ova predstava za mene predstavlja prelijepu i ljupku sliku istočne Evrope prije Drugog svjetskog rata. Prikazuje vrijeme kad su ljudi imali manire, poštovali sebe i druge, poštovali jezike kojima su govorili, kako svoj tako i jezike drugih. Ideja, narod, nacija, grupa tada je značila nešto. Nakon 1945. godine društvene, etičke i umjetničke karakteristike čovjeka su se promijenile i pojavila se politika i cinizam. Ono što sam želio pokazati ovom predstavom jeste da, ako je svijet prije opstao, to je moguće i sada, ali samo ako se fokusiramo na nekoliko pravila, principa, kao što je poštovanje drugih i različitih, solidarnost, briga prema jezicima. Ustvari mislim da ova predstava pokazuje šta Bosanci trebaju sada, to je mirna i duhovita priča, s lijepim emocijama i nježnim osjećajima. To će dati nadu ljudima u ovim vremenima podjele", "Volim se smijati, a Murray Schisgal je napisao veoma zabavan komad kojem se smijemo, s kojim se smijemo i oko kojeg se smijemo. Kakva blagodat! Kako ova komedija, čija se radnja odvija 1960-tih godina u Brooklynu, u New Yorku, može danas dotaknuti naš život? Jednostavno: zato jer se svi mi volimo smijati i svi želimo osjetiti ljubav.Također, LJUPAF /LUV pokreće niz pitanja o životu: Šta je ljubav? Kako je naći? I kad je nađemo, kako je održati u životu u ovom svijetu koji ponekad izgleda potpuno okrenut naopačke?", "Predstava „Predstava „Umri muški“ je nastala davne 1990. kao diplomska predstava Tatjane Šojić, i od tada nije prestala puniti salu Kamernog teatra 55 i doživjela je preko 250 izvođenja postavši najizvođenijom bosanskohercegovačkom predstavom svih vremena. Nastala kao nepretenciozna i niskobudžetna komedija o muško-ženskim odnosima, „Umri muški“ je, isključivo zahvaljujući neprekidnom interesu publike, postala kultna predstava Kamernog teatra 55. Eva, Bruno i Mario u briljantnoj interpretaciji Tatajane Šojić, Admira Glamočaka i Senada Bašića postali su tako junaci čije replike njihovi brojni fanovi, koji su predstavu gledali i po deset, petnaest ili dvadeset puta, znaju napamet, uvijek u njima otkrivajući novu istinitost, životnost i duhovitost.", "Ova predstava se bavi likovima koje svakodnevno srećemo u haustorima, ispred zgrade, pored zgrade, svuda oko nas. Oni možda imaju iste probleme kao i mi, ali to nikad nećemo saznati jer smo prestali otvoreno pričati. Da, mi žučno pričamo o vremenu, politici, velikim temama – ali negdje u tim velikim temama smo se izgubili mi, mali ljudi. Mali ljudi sa nama velikim problemima. A, potrebno je samo malo hrabrosti, malo spremnosti da podijelimo pokoju emociju, intimu, sa ljudima oko nas, kako bi shvatili da svuda oko nas postoje osjećajna, ranjiva bića koja imaju iste probleme. Ljudska bića spremna i sposobna da nam pomognu, da nas usreće, da budu naši idealni partneri."]
    
    let locationDescription =  ["Ova predstava predstavlja prelijepu i ljupku sliku istočne Evrope prije Drugog svjetskog rata.", "Volim se smijati, a Murray Schisgal je napisao veoma zabavan komad kojem se smijemo, s kojim se smijemo i oko kojeg se smijemo...", "Predstava „Umri muški“ je nastala davne 1990. kao diplomska predstava Tatjane Šojić, i od tada nije prestala puniti salu Kamernog teatra 55 i doživjela je preko 250 izvođenja... ", "Ova predstava se bavi likovima koje svakodnevno srećemo u haustorima, ispred zgrade, pored zgrade, svuda oko nas."]
    **/

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
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
                self.collectionView.reloadData()
            }
        })
        /**
        
        ref = Database.database().reference()
        databaseHandle = ref?.child("Shows").observe(.childAdded, with: { (snapshot) in
            
            let show = snapshot.value as? String
            if let actualShow = show {
                
            self.showData.append(actualShow)
                self.collectionView.reloadData()
      }   }) **/
        
        // Do any additional setup after loading the view.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return showList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let show: ShowsModel
        show = showList[indexPath.row]
        cell.locationName.text = show.name
        cell.locationDescription.text = show.description
        
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
        
    }
    

    }
    /**
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.locationName.text = locationName[indexPath.row]
        cell.locationImage.image = locationImage[indexPath.row]
        cell.locationDescription.text = locationDescription[indexPath.row]
        
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let vc = storyboard?.instantiateViewController(withIdentifier: "DetailShowViewController") as? DetailShowViewController
        vc?.image = [UIImage(named: name[indexPath.row])]
        vc?.name = [ime[indexPath.row]]
        vc?.desc = [desc[indexPath.row]]

        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
 **/
    
    





