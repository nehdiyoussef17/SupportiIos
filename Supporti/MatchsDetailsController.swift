//
//  ActualiteDetailsController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 1/9/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import Foundation

import UIKit

class MatchsDetailsController: UIViewController {
    
    var  equipe1txt:String?
     var  equipe2txt:String?
    var  datetxt:String?
    var  billet_restantstxt:String?
    var  id_matchstxt:String?
    var prix_billettxt:String?
    var imageView1txt:String?
    var imageView2txt:String?
    
   
    
    @IBOutlet weak var equipe1: UILabel!
    
    @IBOutlet weak var equipe2: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var billets_restants: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var id_matchs: UILabel!
    
  
    @IBOutlet weak var prix_billet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipe1.text = equipe1txt;
        equipe2.text = equipe2txt;
        date.text = datetxt;
        billets_restants.text = billet_restantstxt;
        id_matchs.text = id_matchstxt;
        prix_billet.text = prix_billettxt;
        imageView1.image = UIImage(named: imageView1txt!);
        imageView2.image = UIImage(named: imageView2txt!);
     
        
        
        // Do any additional setup after loading the view.
    }
    
}
