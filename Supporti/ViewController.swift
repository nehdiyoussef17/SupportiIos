//
//  ViewController.swift
//  Supporti
//
//  Created by ESPRIT on 11/24/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire




class ViewController: UIViewController {
    let URL_USER_REGISTER = "http://192.168.133.1:5000/login"
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    
    func promptAction(promptTitle: String, promptText: String){
        
        let alert = UIAlertController(title: promptTitle, message: promptText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        //creating parameters for the post request
               let parameters: Parameters=[
                  
                    "email_user": textFieldEmail.text!,
                   "password_user": textFieldPassword.text!
                   
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
                              //  let jsonData = result as! NSDictionary
                                
                               
                            }
                        }
        promptAction(promptTitle: "Login!", promptText: "login approuved.")
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
