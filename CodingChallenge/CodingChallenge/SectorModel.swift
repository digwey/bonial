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
    //var brouchors : [Brouchr]
    
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
    
    init(dic: NSDictionary)
    {
        print("Object Id : \(dic["id"]) ,Object name : \(dic["name"]) ,Object url : \(dic["url"]) \n")
        self.id = (dic["id"] as? Double)!
        self.name = (dic["name"] as? String)!
        self.url = (dic["url"] as? String)!
    }
}
