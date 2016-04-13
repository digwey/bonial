//
//  SectorCustomTableViewCell.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/10/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit



class SectorCustomTableViewCell: UITableViewCell{

  
    @IBOutlet weak var sectorHeaderView: CustomView!
    @IBOutlet weak var brochureCollectionView: UICollectionView!
    
    
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

extension SectorCustomTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>(dataSourceDelegate: D, forRow row: Int) {
        
        brochureCollectionView.delegate = dataSourceDelegate
        brochureCollectionView.dataSource = dataSourceDelegate
        brochureCollectionView.tag = row
        brochureCollectionView.setContentOffset(brochureCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        brochureCollectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set {
            brochureCollectionView.contentOffset.x = newValue
        }
        
        get {
            return brochureCollectionView.contentOffset.x
        }
    }
}

