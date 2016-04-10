//
//  ServicesManager.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

typealias ServiceResponse = (NSArray?, NSError?) -> Void

class ServicesManager: NSObject {

    override init() {
       
    }
    func getAllSectors(serviceResponse: ServiceResponse){
        ConnectivityManager.makeHTTPGetRequest("https://dl.dropboxusercontent.com/u/41357788/coding_task/api.json",onCompletion: { dic, error-> Void in
            if let e = error{
                serviceResponse(nil,e)
            }else{
                serviceResponse(dic!["sectors"] as? NSArray,nil)
            }
            
            
        })
       
    }
}
