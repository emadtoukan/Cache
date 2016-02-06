 //
//  Store.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation

 class Store {
    
    let name: String?
    let potentialSavings: String?
    let distanceAway: String?
    let items: [StoreItem]?
    let pictureName: String?
    
    init(json: [String: AnyObject]) {
        name = json["storeName"] as? String
        potentialSavings = json["totalPotentialSaving"] as? String
        distanceAway = json["kmAway"] as? String
        let storeItems = json["items"] as? [[String: String]]
        var tempItems = [StoreItem]()
        for storeItem in storeItems! {
            tempItems.append(StoreItem(json: storeItem))
        }
        items = tempItems
        pictureName = json[""] as? String
    }
 }