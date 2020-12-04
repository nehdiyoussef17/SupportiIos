//
//  ViewController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 11/24/20.
//  Copyright © 2020 Nehdi Youssefs. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKLoginKit
import GoogleSignIn




class ViewController: UIViewController, LoginButtonDelegate, GIDSignInDelegate {
    
    
    
    
    
    
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
                var responseData : NSData!
            
                //getting the json value from the server
                            if let result = response.result.value {
                                
                                //converting it as NSDictionary
                               
                                
                               
                                
                               
                        
                
                        
                if String(result  as! String) == ("User Not Found!!!") {
                    self.promptAction(promptTitle: "Erreur!", promptText: "utilisateur introuvable")
        }
                else if String(result  as! String) == ("Wrong Password") {
                    self.promptAction(promptTitle: "erreur!", promptText: "mot de passe incorrect")
               }
        
                else {
                    
                    let story = UIStoryboard(name: "Main", bundle:nil )
                    let controller = story.instantiateViewController(identifier: "ActualiteController") as! ActualiteController
                    self.present(controller, animated: true, completion: nil)
                    }
                            }
               }
    }
    
    
    
    @IBAction func GoogleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.signIn()
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            print("TESTs")
            print(user.userID!)
            promptAction(promptTitle: "Bienvenu!", promptText: user.userID!)
        }
    }
    
                    override func viewDidLoad() {
                        super.viewDidLoad()
                        //********google*******//
                        GIDSignIn.sharedInstance()?.delegate = self
                        
                        //********facebook******//
                        if let token = AccessToken.current, token.isExpired {
                            
                            let token = token.tokenString
                            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                                     parameters: ["fields":"email, name"],
                                                                     tokenString: token,
                                                                     version: nil,
                                                                     httpMethod: .get)
                            request.start(completionHandler: {connection, result, error in
                                print("\(result)")
                            })
                            
                            }
                        else{
                            let loginButton = FBLoginButton(); loginButton.center = view.center;
                                loginButton.delegate = self
                                loginButton.permissions = ["public_profile", "email"]
                            view.addSubview(loginButton)
                            
                        }
                         }
    
    
 
        
    
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields":"email, name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start(completionHandler: {connection, result, error in
            print("\(result)")
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
                        
                        // Do any additional setup after loading the view, typically from a nib.
                    }

                   
                        // Dispose of any resources that can be recreated.
                    
    


