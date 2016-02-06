//
//  StoreItem.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation


class StoreItem {
    
    let title: String?
    let potentialSavings: String?
    let pictureName: String?
    
    init(json: [String: String]) {
        title = json["title"]
        potentialSavings = json["saving"]
        pictureName = json["pictureName"]
    }
}