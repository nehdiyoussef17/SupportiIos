//
//  RegisterController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/1/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
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
        
        //creating parameters for the post request
               let parameters: Parameters=[
                   "nom_user": textFieldNom.text!,
                "prenom_user": textFieldPrenom.text!,
                    "email_user": textFieldEmail.text!,
                   "password_user": textFieldPassword.text!,
                   "tel_user": textFieldPhone.text!
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
                    
                    override func viewDidLoad() {
                        super.viewDidLoad()
                        // Do any additional setup after loading the view, typically from a nib.
                    }

                    override func didReceiveMemoryWarning() {
                        super.didReceiveMemoryWarning()
                        // Dispose of any resources that can be recreated.
                    }

    
                }
