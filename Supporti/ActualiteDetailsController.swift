//
//  ActualiteDetailsController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 1/9/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import Foundation

import UIKit

class ActualiteDetailsController: UIViewController {
    
    var  nomtxt:String?
     var  desctxt:String?
    
    @IBOutlet weak var actImage: UIImageView!
    
    
    @IBOutlet weak var titre: UILabel!
    
    
    @IBOutlet weak var contenu: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titre.text = nomtxt;
        contenu.text = desctxt;
     
        
        
        // Do any additional setup after loading the view.
    }
    
}
