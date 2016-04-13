//
//  CustomView.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/10/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//


import UIKit

@IBDesignable class CustomView: UIView {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    // Outlets
    
    @IBOutlet weak var sectorName: UILabel!
    @IBOutlet weak var noItemsInSection: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBInspectable var sectorLogo: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    
}
