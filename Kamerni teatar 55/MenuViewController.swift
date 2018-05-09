//
//  MenuViewController.swift
//  Kamerni teatar 55
//
//  Created by mini6 on 09/04/2018.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit
protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
    
    }

class MenuViewController: UIViewController{

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseTapped(_ sender: UIButton) {
        btnMenu.tag = 0
        btnMenu.isHidden = false
        
        if(self.delegate != nil)
        {
            var index = Int32(sender.tag)
            if(sender == self.btnCloseMenuOverlay)
            {
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations:{ () -> Void in
            self.view.frame=CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width:
                UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            
        })
    }

    @IBAction func btnHomeTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(DVC, animated: true)    }
    
    @IBAction func btnContactTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    @IBAction func btnAboutUsTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        self.navigationController?.pushViewController(DVC, animated: true)    }
    
    @IBAction func btnAnsamblTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "AnsamblViewController") as! AnsamblViewController
        self.navigationController?.pushViewController(DVC, animated: true)      }
    
    @IBAction func btnShowsTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "ShowsViewController") as! ShowsViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    @IBAction func btnEventsTapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    
    @IBAction func btnPartnershiptapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "PartnersViewController") as! PartnersViewController
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    
    @IBAction func btnVerifytapped(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "VerifyViewController") as! VerifyViewController
        self.navigationController?.pushViewController(DVC, animated: true)
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
