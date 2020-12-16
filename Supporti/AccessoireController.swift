//
//  AccessoireController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/13/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import Alamofire
import UIKit

class AccessoireController: UIViewController, UITableViewDataSource, UITableViewDelegate{

 
  
    @IBOutlet weak var tableView: UITableView!
    
    
    
    private var users = [Accessoire]()

    
    
    final let serverUrl = URL(string: "http://192.168.133.1:5000/accessoire")
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
        downloaJson()
}
    
    
    func downloaJson(){
        guard let downloadURL = serverUrl else {return}
        URLSession.shared.dataTask(with: downloadURL){data, URLResponse, Error in
            guard let data = data, Error == nil , URLResponse != nil else {
                print("il existe une erreur ")
                return}
            print("downlod en cours ")
            do
            {
           let decoder = JSONDecoder()
                let produits = try decoder.decode([Accessoire].self, from: data)
    
                 print(produits.count)
                 print(produits[0].nom_acc + produits[0].desc_acc)
                 
                self.users = produits
              
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
            catch
            {
                print("il existe fdfr")
                
            }
        }.resume()
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "accCell")
        
        let contentView = cell?.contentView
        
        let label = contentView?.viewWithTag(1) as! UILabel
        label.text = users[indexPath.row].nom_acc
        
        let desc = contentView?.viewWithTag(2) as! UILabel
        desc.text = users[indexPath.row].desc_acc
                
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt  indexPath: IndexPath) {
            
            performSegue(withIdentifier: "AccSegue", sender: indexPath)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "AccSegue")
                     {
                         let indexPath = sender as! IndexPath
                         let indice = indexPath.row
                       print(indice)
                
                     
            
                let  nom = users[indice].nom_acc
                let desc = users[indice].desc_acc
                let id = users[indice].id_acc
                let image = users[indice].image_acc
                let prix = users[indice].prix_acc
                
            let destination = segue.destination as! AccessoiresDetailsController
            destination.nomtxt = nom
            destination.desctxt = desc
            destination.prixtxt = "\(prix)"
            destination.idtxt = "\(id)"
            
                
                
            
        }
    
    
}
}
