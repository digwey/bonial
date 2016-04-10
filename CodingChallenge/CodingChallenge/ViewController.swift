//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sectors = [SectorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let serviceManager = ServicesManager()
        
        serviceManager.getAllSectors({array,error-> Void in
            if let e = error{
                print("digwey\(e.description)")
            }else{
                for s in array!{
                    self.sectors.append(SectorModel(dic: s as! NSDictionary))
                }
                print(self.sectors);
            }
        })
    }
}

