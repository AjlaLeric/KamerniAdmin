//
//  DetailViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: BaseViewController {

  @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.5, 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.8584979, 18.4191316)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        map.addAnnotation(annotation)
        // Do any additional setup after loading the view.
        addSlideMenuButton()
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
