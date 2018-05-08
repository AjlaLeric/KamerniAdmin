//
//  AnsamblViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit


class AnsamblViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    var name = [ "Emir Hadzihafizbegovic","Boris Ler", "Zana Marjanovic", "Muhamed Hadzovic", "Mirsad Tuka", "Dragan Jovicic", "Tatjana Sojic", "Vanesa Glodjo", "Fedja Stukan", "Aida Bukva", "Amar Selimovic", "Gordana Boban", "Jasna Ornela Bery", "Maja Izetbegovic", "Merima Ovcina-Smajovic", "Ravijojla Jovancic-Lesic", "Sabina Bambur", "Sadzida Setic", "Sasa Petrovic", "Senad Alihodzic"]
    
    
    let elements = [ "Emir Hadzihafizbegovic","Boris Ler", "Zana Marjanovic", "Muhamed Hadzovic", "Mirsad Tuka", "Dragan Jovicic", "Tatjana Sojic", "Vanesa Glodjo", "Fedja Stukan", "Aida Bukva", "Amar Selimovic", "Gordana Boban", "Jasna Ornela Bery", "Maja Izetbegovic", "Merima Ovcina-Smajovic", "Ravijojla Jovancic-Lesic", "Sabina Bambur", "Sadzida Setic", "Sasa Petrovic", "Senad Alihodzic"]
    
    var ime = [ "Emir Hadzihafizbegovic","Boris Ler", "Zana Marjanovic", "Muhamed Hadzovic", "Mirsad Tuka", "Dragan Jovicic", "Tatjana Sojic", "Vanesa Glodjo", "Fedja Stukan", "Aida Bukva", "Amar Selimovic", "Gordana Boban", "Jasna Ornela Bery", "Maja Izetbegovic", "Merima Ovcina-Smajovic", "Ravijojla Jovancic-Lesic", "Sabina Bambur", "Sadzida Setic", "Sasa Petrovic", "Senad Alihodzic"]
    
    var desc = [ "Emir Hadžihafizbegović rođen je 20.08.1961. g. u Tuzli. Osnovnu i srednju školu završio je u Tuzli. Akademiju scenskih umjetnosti u Sarajevu upisuje 1982-ge godine i diplomira 1986-te godine u klasi profesora docenta Emira Kusturice. Nakon diplomiranja živi i radi u Sarajevu.","Najbolji student 2006/ 2007, Akademija scenskih umjetnosti 2009, Nagrada „Rejhan Demirdžić“ za najboljeg mladog glumca festivala MESS Prsten Tmače“, za najboljeg mladog glumca, Mostar Zenica, Nagrada za scenu u predstavi „Muholovac“ Kamernog teatra 55", "Datum i mjesto rođenja: 31.05.1983. Obrazovanje:1997 – 2000 Fiorello H. LaGuardia High School of Music & Art and Performing Arts, New York, New York 2000 – 2001 Druga Gimnazija, Sarajevo, BIH 2001 – 2006 Akademija scenskih umjetnosti u Sarajevu", "Datum i mjesto rođenja: Sarajevo, 16.07 1984 Obrazovanje: diplomirani glumac ULOGE U AKTUALNOM REPERTOARU TEATRA „Radnja na uglu“ (Francois Lunel), uloga: Kralik „Šta smo to učinili“ (Dino Mustafić), uloge: Sin, Mrtvozornik „U Zvorniku ja sam ostavio svoje srce“ (Sulejman Kupusović), uloga: Nikola „Terorizam“ (Dino Mustafić), uloga:Prvi muškarac", "Mirsad Tuka", "Dragan Jovicic", "Tatjana Sojic", "Vanesa Glodjo", "Fedja Stukan", "Aida Bukva", "Amar Selimovic", "Gordana Boban", "Jasna Ornela Bery", "Maja Izetbegovic", "Merima Ovcina-Smajovic", "Ravijojla Jovancic-Lesic", "Sabina Bambur", "Sadzida Setic", "Sasa Petrovic", "Senad Alihodzic"]
    
    


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        addSlideMenuButton()

        // Do any additional setup after loading the view.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        @available(iOS 2.0, *)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
        {
          let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
            
       cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
            
            cell.mhlbl.text = elements[indexPath.row]
            cell.mhimage.image = UIImage(named: elements[indexPath.row])
            cell.mhimage.layer.cornerRadius = cell.mhimage.frame.height / 2
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let x = storyboard?.instantiateViewController(withIdentifier: "ActorViewController") as? ActorViewController
        x?.image = [UIImage(named: name[indexPath.row])]
        x?.name = [ime[indexPath.row]]
        x?.desc = [desc[indexPath.row]]
        self.navigationController?.pushViewController(x!, animated: true)
        
    }
    
    
    
}
