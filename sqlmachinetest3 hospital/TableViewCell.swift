//
//  TableViewCell.swift
//  sqlmachinetest3 hospital
//
//  Created by Mac on 13/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var eardnolbl: UILabel!
    @IBOutlet weak var drnamelbl: UILabel!
    
    @IBOutlet weak var hospnamelbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
