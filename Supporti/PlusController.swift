//
//  PlusController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/16/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class PlusController: UIViewController {

    
   
    @IBOutlet weak var EmailUser2: UILabel!
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "connected")
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ActualiteController")
        self.present(next!, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailUser2.text=UserDefaults.standard.string(forKey: "UserEmailConnected")
    }
    
    
    
    
}
