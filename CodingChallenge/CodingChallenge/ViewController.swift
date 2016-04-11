//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var sectors = [SectorModel]()
    
    @IBOutlet weak var sectorTableView: UITableView!
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
                //print(self.sectors);
                
                dispatch_async(dispatch_get_main_queue(),{
                    self.sectorTableView.reloadData()
                })
            }
        })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectors.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        let cell = tableView.dequeueReusableCellWithIdentifier("SectorCustomTableViewCell", forIndexPath: indexPath) as! SectorCustomTableViewCell

        

        let sector = self.sectors[indexPath.row]
        

        cell.sectorHeaderView.sectorName.text = sector.name
        cell.sectorHeaderView.noItemsInSection.text = "\(sector.brouchors.count)"
        
        
        cell.sectorHeaderView.imageView.downloadedFrom(link: sector.url, contentMode: .Center)
        
        
        return cell
    }
    
    
}

extension UIImageView {
    func downloadedFrom(link link:String, contentMode mode: UIViewContentMode) {
        guard
            let url = NSURL(string: link)
            else {return}
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }).resume()
    }
}

