
//
//  actCell.swift
//  Supporti
//
//  Created by Nehdi Youssef on 1/10/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet weak var nom: UITextField!
    
    @IBOutlet weak var prenom: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var tel: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

