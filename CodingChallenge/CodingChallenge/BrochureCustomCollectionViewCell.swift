//
//  BrochureCustomCollectionViewCell.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/12/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class BrochureCustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var retailName: UILabel!
    @IBOutlet weak var brochureName: UILabel!
    @IBOutlet weak var brochureImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
}
