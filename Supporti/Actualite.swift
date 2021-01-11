//
//  Actualite.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/13/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import UIKit

class Actualite: Codable{

     let id_act : Int
    let titre_act : String
    let contenu_act : String
    let date_act : String
    let id_equipe : Int
    let id_user : Int
    
    
   
    init(id_act: Int, titre_act: String, contenu_act: String, date_act: String, id_equipe: Int, id_user: Int) {
        
        
        self.id_act = id_act
        self.titre_act = titre_act
        self.contenu_act = contenu_act
        self.date_act = date_act
        self.id_equipe = id_equipe
        self.id_user = id_user

    }
 
}
