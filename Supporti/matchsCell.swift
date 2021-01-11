
//
//  actCell.swift
//  Supporti
//
//  Created by Nehdi Youssef on 1/10/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit

class matchsCell: UITableViewCell {

 
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var equipe1: UILabel!
    
    @IBOutlet weak var equipe2: UILabel!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

