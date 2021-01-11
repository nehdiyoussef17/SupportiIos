//
//  PlusController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/16/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class PlusController: UIViewController {

    var id_user = String()
        var  nom_user = String()
        var prenom_user = String()
        var email_user = String()
        var tel_user = String()
   
    
    
    @IBOutlet weak var nom: UITextField!
    
    @IBOutlet weak var prenom: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var tel: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var EmailUser2: UILabel!
   
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "connected")
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ActualiteController")
        self.present(next!, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        print("hedha tel fil plus controller")
        print(tel_user);
        
        super.viewDidLoad()
        nom.text=UserDefaults.standard.string(forKey: "UserNameConnected")
        prenom.text=UserDefaults.standard.string(forKey: "UserPrenameConnected")
        email.text=UserDefaults.standard.string(forKey: "UserEmailConnected")
    tel.text=UserDefaults.standard.string(forKey: "UserPhoneConnected")
        
        EmailUser2.text=UserDefaults.standard.string(forKey: "UserEmailConnected")
    }
    
    
    
    
}
