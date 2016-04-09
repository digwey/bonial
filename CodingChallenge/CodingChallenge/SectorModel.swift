//
//  SectorModel.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class SectorModel {
    
    // MARK: Properties
    
    var id: Double
    var name: String
    var url: String
    
    // MARK: Initialization
    //Make it as failable initializer to can return nil when initialization
    init?(id: Double, name: String, url: String) {
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.url = url
        
        if(id < 0){
            return nil
        }
    }
}
