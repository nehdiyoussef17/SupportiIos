//
//  actCell.swift
//  Supporti
//
//  Created by Nehdi Youssef on 1/10/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit

class actCell: UITableViewCell {

 
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

