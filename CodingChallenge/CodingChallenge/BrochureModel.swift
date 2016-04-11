//
//  BrochureModel.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/10/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class BrochureModel {
    
    var brochureId: Double
    var coverUrl: String
    var title: String
    var retailerName: String
    
    
    // MARK: Initialization
    //Make it as failable initializer to can return nil when initialization
    init?(brochureId: Double, coverUrl: String, title: String, retailerName: String) {
        // Initialize stored properties.
        self.brochureId = brochureId
        self.coverUrl = coverUrl
        self.title = title
        self.retailerName = retailerName
        if(brochureId < 0){
            return nil
        }
    }
    //Using this initializer to parse JSON from NSDictionary to data model
    init(dic: NSDictionary)
    {
        self.brochureId = (dic["id"] as? Double)!
        self.coverUrl = (dic["coverUrl"] as? String)!
        self.title = (dic["title"] as? String)!
        self.retailerName = (dic["retailerName"] as? String)!
    }
}
