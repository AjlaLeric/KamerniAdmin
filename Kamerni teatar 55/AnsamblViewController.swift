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
    
    var desc = [ "Emir Hadžihafizbegović rođen je 20.08.1961. g. u Tuzli. Osnovnu i srednju školu završio je u Tuzli. Akademiju scenskih umjetnosti u Sarajevu upisuje 1982-ge godine i diplomira 1986-te godine u klasi profesora docenta Emira Kusturice. Nakon diplomiranja živi i radi u Sarajevu.","Najbolji student 2006/ 2007, Akademija scenskih umjetnosti 2009, Nagrada „Rejhan Demirdžić“ za najboljeg mladog glumca festivala MESS Prsten Tmače“, za najboljeg mladog glumca, Mostar Zenica, Nagrada za scenu u predstavi „Muholovac“ Kamernog teatra 55", "Datum i mjesto rođenja: 31.05.1983. Obrazovanje:1997 – 2000 Fiorello H. LaGuardia High School of Music & Art and Performing Arts, New York, New York 2000 – 2001 Druga Gimnazija, Sarajevo, BIH 2001 – 2006 Akademija scenskih umjetnosti u Sarajevu", "Datum i mjesto rođenja: Sarajevo, 16.07 1984 Obrazovanje: diplomirani glumac ULOGE U AKTUALNOM REPERTOARU TEATRA „Radnja na uglu“ (Francois Lunel), uloga: Kralik „Šta smo to učinili“ (Dino Mustafić), uloge: Sin, Mrtvozornik „U Zvorniku ja sam ostavio svoje srce“ (Sulejman Kupusović), uloga: Nikola „Terorizam“ (Dino Mustafić), uloga:Prvi muškarac", "Profesionalnu karijeru glumca započeo je kao polaznik Dramskog studija tuzlanskog Narodnog pozorišta. Završio je Fakultet dramskih umjetnosti u Beogradu. Debitirao je u filmu Praznik u Sarajevu. Za tu ulogu nagrađen je na Festivalu glumačkih ostvarenja u Nišu 1991, kao najbolji glumac - debitant. Od 1996. član je ansambla sarajevskog Kamernog teatra 55. Odigrao je mnoge uloge u pozorišnim predstavama, od kojih izdvajamo predstave To Alije Isakovića,Poljska konjica Marka Vešovića i Hasanaginica za koje je i nagrađivan. Igrao je i u mnogim filmovima i tv serijama, od kojih sam voli izdvojiti filmove Nafaka, Sve džaba, Remake, Ostavljeni i Warriors.", "Dragan Jovičić, direktor sarajevskog Kamernog teatra 55, rođen je 1953. godine u Rogatici. Studij glume završio je 1976. na Odsjeku za scenske umjetnosti Filozofskog fakulteta u Sarajevu. Iako je profesionalno angažiran u Kamernom teatru 55, pa u sarajevskom Narodnom pozorištu, njegovi prvi glumački uspjesi su, ipak, vezani za film i televiziju kada stiče najširu popularnost kao Stojan Mutikaša u tv-seriji Porobdžije (rađenoj prema djelu Svetozara Ćorovića) u režiji Aleksandra Jevđevića.", "Tatjana Šojić je glumica iz Bosne i Hercegovine, a rođena je 9. aprila 1964. godine u Sarajevu. Pošto nije verovala da će uspeti da upiše glumu, Tatjana upisuje Veterinarski fakultet, ali nakon par godina uspeva u svojoj nameri i u Sarajevu upisuje „Akademiju za scensku umjetnost“. U njenoj klasi je bio i čuveni glumac Branko Đurić, a Tatjana je na akademiji bila asistent svom profesoru Nenadu Dizdareviću. Nakon završetka rata u Bosni, vratila se iz Praga i postala deo „Kamernog teatra 55“.", "Vanesa Glođo još je jedna od bh. glumica koja je svoje izvrsno glumačko umijeće pokazala u filmu U zemlji krvi i meda Angeline Jolie. Zbog toga je, kao i glavna glumica Zana Marijanović, ovih dana u stalnom centru pozornosti svih svjetskih medija. Ova glumica rođena 8.6.1974. iza sebe ima brojne predstave i filmove. Završila je Akademiju scenskih umjetnosti u Sarajevu. Što se tiče teatra radila je sa poznatim redateljima kao što su Sulejman Kupusović, Dino Mustafić, Jasmila Zbanić, Faruk Lončarević, Aleš Kurt, Lee De Long i dr.", "Akademija scenskih umjetnosti Sarajevo,diplomirani glumac PROFESIONALNO ISKUSTVO / TEATAR, ZLOČIN NA KOZIJEM OTOKU/ režija: Senka Bulić/ Istarsko Narodno Pozorište, CIRCUS INFERNO / uloga: Brut, Reditelj: Pjer Žalica Pozorište Mladih , Sarajevo, TRAINSPOTTING/ uloga: Mark Renton, režija: Dragan Marinković / Teatar 92, Director: Danis Tanović | Pro.ba production, Sarajevo, BLIŽE / uloga: Dan ,režija: Dragan Marinković/ Kamerni Teatar 55", "Datum i mjesto rođenja: 23. 09. 1985. Obrazovanje: O.Š. “Isak samokovlija”, osnovna muzička škola “Mladen Pozajić”, KŠC “Opća Realna Gimnazija”, Akademija scenskih umjetnosti u klasi prof. Senada Bašića i ass. Arme Tanović-Branković", "DATUM I MJESTO ROĐENJA: 15.1.1982., Tuzla OBRAZOVANJE: Akademija scenskih umjetnosti Sarajevo, Odsjek za glumu ULOGE U AKTUELNOM REPERTOARU TEATRA „Radnja na uglu“ (Francois Lunel), uloga: Vadas „Šta smo to učinili“ (Dino Mustafić), uloga: Sin “U Zvorniku ja sam ostavio svoje srce” (Sulejman Kupusović), uloga: Simić Terorizam“ (Dino Mustafić), uloga: Muškarac", "Gordana Boban, (Livno, 13. rujna 1967.) je dramska umjetnica mlađe generacije iz Livna. Već od ranog djetinjstva mlada je Gordana Boban aktivan član livanjskog kulturno-umjetničkog društva Radnik u kojem se tijekom osamdesetih godina pojavljuje u velikom nizu uloga Amaterskog kazališta Livno. Prve važnije uloge ostvarila je u Sretnom princu (1982.) Oscara Wildea, Sretnoj priči (1983.) i Kosarinom vijencu (1984.) Pere Mioča, te oratoriju Jadi Ne Vujadine (1986) Alda Kezića. Akademsko obrazovanje dramske umjetnice stječe na Akademiji scenskih umjetnosti u Sarajevu. Značajnije uloge u dramskim predstavama Tetoviranom pozorištu, Ženski turbofolk bend i Mjesečevoj Predstavi, te u filmovima: Gori vatra (2002), Nafaka (2006) i drugi.", "Jasna Beri (Zenica, 2.1.1954.), znana i kao Jasna Ornela Bery, je bosanskohercegovačka filmska, TV i kazališna glumica. Najpoznatija je po filmovima Na putu, U zemlji krvi i meda, Snijeg i Grbavica, koji je nagrađen Zlatnim medvjedom na Berlinaleu. Aprila 1994. godine vratila se u opkoljeno Sarajevo odakle je prethodno izbjegla po izbijanju rata u BiH.[2]", "Datum i mjesto rođenja: 20.02.1985. Sarajevo, Obrazovanje: Akademija scenskih umjetnosti Sarajevo, ULOGE U AKTUALNOM REPERTOARU TEATRA „Sumnja“ (Selma Spahić), uloga: Sestra James „Šta smo to učinili?“ (Dino Mustafić), uloga: Djevojčica, Mlada žena sa djetetom, Snaha „Terorizam“ (Dino Mustafić), uloga: Žena", "Datum i mjesto rođenja: 1972. g. u Zenici, BiH, Obrazovanje: Akademija scenskih umjetnosti, Sarajevo, ZNAČAJNIJE TEATARSKE ULOGE: Schisgal Myrray “Tigar” (Gloria), rež. Dragan Marinković, Kamerni teatar 55, Sead Fetahagić “Kako je počelo” (Željka), rež. Marianne de Pury,Kamerni teatar 55, Nedžad Ibrišimović “Ugursuz” (Safija), rež. Gradimir Gojer, Kamerni teatar 55, Skender Kulenović “Djelidba” (Rabija), rež. Sulejman Kupusović, Kamerni teatar 55", "Datum i mjesto rođenja: 12. januar 1952. SarajevoObrazovanje: Gimnazija “Braće Ribar”, Dramski Studio – Filozofski fakultet –gluma, dipl. 1974., Komparativna književnost i teatrologija, dipl. 1976., Engleski jezik i književnost, dipl. 1984., ULOGE U AKTUALNOM REPERTOARU TEATRA „Radnja na uglu“(Fransoir Lunel), uloga: Klijentica", "Datum i mjesto rođenja: 20.04. 1970. Trebinje, BiH, OBRAZOVANJE: Osnovna škola “H. Kikić“, Sarajevo, Baletna Akademija”A. Vaganova” (usavršavanje) St. Peterburg, Prva Gimnazija, Sarajevo, Akademija scenskih umjetnosti Sarajevo, klasa pof. Bore Stjepanovića", "Rodjena: 1968, Sarajevo. Diplomirala na ASU Sarajevo (klasa prof.Bore Stjepanovića), odsjek za glumu.ULOGE U AKTUALNOM REPERTOARU TEATRA „Šta smo to učinili“ (Dino Mustafić)", "Aleksandar Saša Petrović je bosanskohercegovački glumac. Prvu glavnu filmsku ulogu ostvario je u filmu Srđana Vuletića Teško je biti fin, za koju je dobio Srce Sarajeva za najboljeg muškog glumca na SFF-u 2007. Također je učestvovao i u sarajevskoj kultnoj predstavi Audicija.", "Datum i mjesto rođenja: 13.08.1978 , Sarajevo, Obrazovanje: Akademija scenskih umjetnosti u Sarajevu, ULOGE U AKTUALNOM REPERTOARU TEATRA Radnja na uglu“ (Francois Lunel), uloga:Pirovitch „Terorizam“ (Dino Mustafić), uloga: Muškarac"]
    
    


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
