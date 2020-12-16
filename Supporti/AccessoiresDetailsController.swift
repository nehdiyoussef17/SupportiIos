//
//  AccessoiresDetailsController.swift
//  Supporti
//
//  Created by Nehdi Youssef on 12/15/20.
//  Copyright © 2020 ESPRIT. All rights reserved.
//

import Foundation
import UIKit

class AccessoiresDetailsController: UIViewController {
    
   var  nomtxt:String?
    var  desctxt:String?
    var  prixtxt:String?
    var  idtxt:String?
    
    
    @IBOutlet weak var accImage: UIImageView!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var nom: UILabel!
    
    @IBOutlet weak var prix: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id.text = idtxt
        nom.text = nomtxt
        prix.text = prixtxt
        desc.text = desctxt
     
        
        
        // Do any additional setup after loading the view.
    }
    

}
