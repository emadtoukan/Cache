//
//  Transaction.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation

class Transaction {
    
    let storeName: String?
    let receiptDate: String?
    let address: String?
    let amountSpent: String?
    let totalSave: String?
    let receiptPictureName: String?
    
    init(json: [String: AnyObject]) {
        storeName = json["name"] as? String
        receiptDate = json["date"] as? String
        address = json["address"] as? String
        amountSpent = json["total"] as? String
        totalSave = json["saved"] as? String
        receiptPictureName = json["image"] as? String
    }
}