//
//  Accessoire.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/13/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class Accessoire: Codable{

     let id_acc : Int
    let nom_acc : String
    let desc_acc : String
    let prix_acc : Int
    let image_acc : String
    
    
   
    init(id_acc: Int, nom_acc: String, desc_acc: String, prix_acc: Int, image_acc: String) {
        
        
        self.id_acc = id_acc
        self.nom_acc = nom_acc
        self.desc_acc = desc_acc
        self.prix_acc = prix_acc
        self.image_acc = image_acc
        
    }
 
}
