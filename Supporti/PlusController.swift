//
//  PlusController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/16/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire

class PlusController: UIViewController {
    
    var id_user = String()
        var  nom_user = String()
        var prenom_user = String()
        var email_user = String()
        var tel_user = String()
    
    let URL_USER_REGISTER = "http://192.168.133.1:5000/update_user"+UserDefaults.standard.string(forKey: "UserIdConnected")!
   
   
    
    
    @IBOutlet weak var nom: UITextField!
    
    @IBOutlet weak var prenom: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var tel: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func modif(_ sender: Any) {
        
        guard let nomU = nom.text, !nomU.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre nom", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        guard let prenomU = prenom.text, !prenomU.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre prenom", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        guard let emailU = email.text, !emailU.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre email", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        if(isValidEmail(emailID: emailU) == false )
                {
                    let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide email", preferredStyle: UIAlertController.Style.alert)
                     myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                     self.present(myalert, animated: true)
                }
        
        //********************************************
        guard let phone = tel.text, !phone.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre numéro de télephone", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        if(isValidTel(telID: phone) == false )
                {
                    let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide telephone", preferredStyle: UIAlertController.Style.alert)
                     myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                     self.present(myalert, animated: true)
                }
        //********************************************
        guard let mdp = pass.text, !mdp.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre mot de passe", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        
        
        
        
        
               let parameters: Parameters=[
                   "nom_user": nomU,
                "prenom_user": prenomU,
                    "email_user": emailU,
                   "password_user": mdp,
                   "tel_user": phone
               ]
        
               
               //Sending http post request
               Alamofire.request(URL_USER_REGISTER, method: .put, parameters: parameters).responseJSON
               {
                   response in
                   //printing response
                   print(response)
                   
                //getting the json value from the server
                           if let result = response.result.value {
                                
                                //converting it as NSDictionary
                               // let jsonData = result as! NSDictionary
                                //alamofire object mapper
                                //displaying the message in label
                              //  self.LabelMessage.text = jsonData.value(forKey: "message") as! String?
                                
                               
                            
                            }
                        
        }
        
        promptAction(promptTitle: "Modification avec succée!", promptText: "Rebienvenu au Supporti.")
                    }
                    
    func isValidEmail(emailID:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: emailID)
            }
        func isValidTel(telID:String) -> Bool {
                let telRegEx = "[0-9]{8,}"
                let telTest = NSPredicate(format:"SELF MATCHES %@", telRegEx)
                return telTest.evaluate(with: telID)
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(0, forKey: "connected")
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ActualiteController")
        self.present(next!, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        
        nom.text=UserDefaults.standard.string(forKey: "UserNameConnected")
        prenom.text=UserDefaults.standard.string(forKey: "UserPrenameConnected")
        email.text=UserDefaults.standard.string(forKey: "UserEmailConnected")
        tel.text=UserDefaults.standard.string(forKey: "UserPhoneConnected")
        super.viewDidLoad()
        
        
       
    }
    
    
    
    
}
