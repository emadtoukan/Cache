//
//  StoreSavings.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation

class StoreSavings {
    
    let stores: [Store]?
    
    init() {
        
        var tempStore = [Store]()
        if let path = NSBundle.mainBundle().pathForResource("StoreSavings", ofType: nil) {
            let url = NSURL(fileURLWithPath: path)
            let contentsOfFile = NSData(contentsOfURL: url)
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(contentsOfFile!, options: NSJSONReadingOptions.AllowFragments) as? [[String: AnyObject]]
                
                for storeJSON in json! {
                    tempStore.append(Store(json: storeJSON))
                }
            } catch {
                print("Something went wrong")
            }
        }
        
        stores = tempStore
        
    }
    
}