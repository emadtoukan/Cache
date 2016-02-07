//
//  Transactions.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import Foundation

class Transactions {
    
    let transactions: [Transaction]?
    
    init() {
        
        var tempTransaction = [Transaction]()
        if let path = NSBundle.mainBundle().pathForResource("Transactions", ofType: nil) {
            let url = NSURL(fileURLWithPath: path)
            let contentsOfFile = NSData(contentsOfURL: url)
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(contentsOfFile!, options: NSJSONReadingOptions.AllowFragments) as? [[String: AnyObject]]
                
                for transactionJSON in json! {
                    tempTransaction.append(Transaction(json: transactionJSON))
                }
            } catch {
                print("Something went wrong with the transactions")
            }
        }
        
        transactions = tempTransaction
        
    }

}