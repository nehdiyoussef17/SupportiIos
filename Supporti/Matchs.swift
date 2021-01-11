
//
//  Matchs.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/13/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class Matchs: Codable{

     let id_matchs : Int
    let equipe1 : String
    let equipe2 : String
    let date_matchs : String
    let billets_restants : Int
    let prix_billet : Int
    
    
    
   
    init(id_matchs: Int, equipe1: String, equipe2: String, date_matchs: String, billets_restants: Int, prix_billet: Int) {
        
        
        self.id_matchs = id_matchs
        self.equipe1 = equipe1
        self.equipe2 = equipe2
        self.date_matchs = date_matchs
        self.billets_restants = billets_restants
        self.prix_billet = prix_billet

    }
 
}
