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
        storeName = json[""] as? String
        receiptDate = json[""] as? String
        address = json[""] as? String
        amountSpent = json[""] as? String
        totalSave = json[""] as? String
        receiptPictureName = json[""] as? String
    }
}