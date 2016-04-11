//
//  SectorCustomTableViewCell.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/10/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit



class SectorCustomTableViewCell: UITableViewCell {

  
    @IBOutlet weak var sectorHeaderView: CustomView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        
        
    }


}
