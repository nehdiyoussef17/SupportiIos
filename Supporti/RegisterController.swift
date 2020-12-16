//
//  RegisterController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/1/20.
//  Copyright © 2020 Nehdi Youssef. All rights reserved.
//

import UIKit
import Alamofire


class RegisterController: UIViewController {
    let URL_USER_REGISTER = "http://192.168.133.1:5000/register"
    
    @IBOutlet weak var textFieldNom: UITextField!
    
    @IBOutlet weak var textFieldPrenom: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPhone: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var LabelMessage: UILabel!
    
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

    @IBAction func buttonRegister(_ sender: Any) {
        
        
        guard let nom = textFieldNom.text, !nom.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre nom", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        guard let prenom = textFieldPrenom.text, !prenom.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre prenom", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        guard let email = textFieldEmail.text, !email.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre email", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        if(isValidEmail(emailID: email) == false )
                {
                    let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide email", preferredStyle: UIAlertController.Style.alert)
                     myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                     self.present(myalert, animated: true)
                }
        
        //********************************************
        guard let phone = textFieldPhone.text, !phone.isEmpty else {
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
        guard let mdp = textFieldPassword.text, !mdp.isEmpty else {
                let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre mot de passe", preferredStyle: UIAlertController.Style.alert)
                 myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                 self.present(myalert, animated: true)
                            return                }
        //********************************************
        
        
        
        
        
               let parameters: Parameters=[
                   "nom_user": nom,
                "prenom_user": prenom,
                    "email_user": email,
                   "password_user": mdp,
                   "tel_user": phone
               ]
        
               
               //Sending http post request
               Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
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
        
        promptAction(promptTitle: "Bienvenu!", promptText: "Bienvenu au Supporti.")
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
    
                    override func viewDidLoad() {
                        super.viewDidLoad()
                        // Do any additional setup after loading the view, typically from a nib.
                    }

                    override func didReceiveMemoryWarning() {
                        super.didReceiveMemoryWarning()
                        // Dispose of any resources that can be recreated.
                    }

    
                }
