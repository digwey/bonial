//
//  ConnectivityManager.swift
//  CodingChallenge
//
//  Created by Mohamed Digwey on 4/9/16.
//  Copyright © 2016 Bonial Org. All rights reserved.
//

import UIKit
typealias ServiceResponse = (NSDictionary?, NSError?) -> Void

class ConnectivityManager : NSObject {
    //Make singletone design pattern
    //I love having all of my REST calls in one place
    static let sharedInstance = ConnectivityManager()
    
    //let baseURL = "https://dl.dropboxusercontent.com/u/41357788/coding_task/api.json"
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let responseData = data {
                // parse the result as JSON, since that's what the API provides
                let post: NSDictionary
                do {
                    post = try NSJSONSerialization.JSONObjectWithData(responseData,
                        options: []) as! NSDictionary
                    onCompletion(post, error)
                } catch  {
                    print("error trying to convert data to JSON")
                    return
                }
                
            } else {
                onCompletion(nil, error)
            }
        })
        task.resume()
    }
}
