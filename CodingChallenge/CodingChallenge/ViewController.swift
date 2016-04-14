//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var sectors = [SectorModel]()
    var storedOffsets = [Int: CGFloat]()

 
    @IBOutlet weak var sectorTableView: UITableView!
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let serviceManager = ServicesManager()
        
        serviceManager.getAllSectors({array,error-> Void in
            if let e = error{
                print("\(e.description)")
            }else{
                for s in array!{
                    self.sectors.append(SectorModel(dic: s as! NSDictionary))
                }
                //the collection view sections should be alphabetically ordered by “sector->name”
                //Using simplicity to calling and implementing funcitons (Power of SWIFT) :)
                self.sectors = self.sectors.sort({$0.name < $1.name})
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SectorCustomTableViewCell", forIndexPath: indexPath) as! SectorCustomTableViewCell

        let sector = self.sectors[indexPath.row]

        cell.sectorHeaderView.sectorName.text = sector.name
        cell.sectorHeaderView.noItemsInSection.text = "\(sector.brouchors.count)"
        cell.sectorHeaderView.imageView.downloadedFrom(link: sector.url, contentMode: .Center)
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? SectorCustomTableViewCell else { return }
        
        
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? SectorCustomTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
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
                
                else {
                    self.image = UIImage(named: "UnavailableImage")
                    return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in

                self.image = image
            }
        }).resume()
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectors[collectionView.tag].brouchors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BrochureCustomCollectionViewCell", forIndexPath: indexPath) as! BrochureCustomCollectionViewCell
        
        let brouchorModel : BrochureModel = sectors[collectionView.tag].brouchors[indexPath.row]
        cell.brochureName?.text = brouchorModel.title
        cell.retailName?.text = brouchorModel.retailerName
        
        
        cell.brochureImage.downloadedFrom(link: brouchorModel.coverUrl, contentMode: .Center)
        
        return cell
    }
    
}

