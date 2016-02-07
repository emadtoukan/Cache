//
//  MoreItemsViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class MoreItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var labelStoreNAme: UILabel!
    var store: Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelStoreNAme.text = store?.name?.uppercaseString
    }

    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - Table View Controller
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store?.items?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("StoreItemCell", forIndexPath: indexPath) as? StoreItemTableViewCell else {
            return UITableViewCell()
        }
        cell.setCellContentForItem(indexPath, storeItem: store?.items?[indexPath.row], hideFifthDivider: false)
        return cell
    }
}
