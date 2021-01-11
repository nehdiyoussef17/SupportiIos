
//
//  AccessoireController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/13/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import Alamofire
import UIKit

class BilleterieController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
  
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchsCell")
        
        let contentView = cell?.contentView
        
        let equipe1 = contentView?.viewWithTag(1) as! UILabel
        equipe1.text = users[indexPath.row].equipe1
        
        let equipe2 = contentView?.viewWithTag(2) as! UILabel
        equipe2.text = users[indexPath.row].equipe2
        
        let date = contentView?.viewWithTag(3) as! UILabel
        date.text = users[indexPath.row].date_matchs
        
        
        
      
        let image1url = (users[indexPath.row].equipe1+".png")
        
        let image2url = (users[indexPath.row].equipe2)
        let imageView1 = contentView?.viewWithTag(4) as! UIImageView
        let imageView2 = contentView?.viewWithTag(5) as! UIImageView
        
        print("ce url est pour l'image")
        print(image1url)
       
        imageView1.image = UIImage(named: image1url)
        imageView2.image =  UIImage(named: image2url)
                
        return cell!
    }

    
    
    
 
  
    
    
    
        private var users = [Matchs]()

    
    
    final let serverUrl = URL(string: "http://192.168.133.1:5000/match")
   
    
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
                let produits = try decoder.decode([Matchs].self, from: data)
    
                 print(produits.count)
                print(produits[0].equipe1 + produits[0].equipe2)
                 
                self.users = produits
              
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
            catch
            {
                print("il existe billet erreurfdfr")
                
            }
        }.resume()
}


    func tableView(_ tableView: UITableView, didSelectRowAt  indexPath: IndexPath) {
            
            performSegue(withIdentifier: "matchsSegue", sender: indexPath)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "matchsSegue")
                     {
                         let indexPath = sender as! IndexPath
                         let indice = indexPath.row
                       print(indice)
                
                     
            
                let  equipe1 = users[indice].equipe1
                let equipe2 = users[indice].equipe2
                let date_matchs = users[indice].date_matchs
                let billets_restants = users[indice].billets_restants
                let id_matchs = users[indice].id_matchs
                let prix_billet = users[indice].prix_billet
                
            let destination = segue.destination as! MatchsDetailsController
                destination.equipe1txt = equipe1
            destination.equipe2txt = equipe2
            destination.datetxt = date_matchs
                destination.billet_restantstxt = "\(billets_restants)"
                destination.id_matchstxt = "\(id_matchs)"
                destination.prix_billettxt = "\(prix_billet)"
                destination.imageView1txt = users[indexPath.row].equipe1;
                destination.imageView2txt = users[indexPath.row].equipe2;
                
                
            }
    
    
    
    

}
}



