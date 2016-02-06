//
//  StoreTableViewCell.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class StoreTableViewCell: BaseTableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableViewInternal: UITableView!
    @IBOutlet var imageViewStoreImage: UIImageView!
    @IBOutlet var labelStoreName: UILabel!
    @IBOutlet var imageViewLocationIcon: UIImageView!
    @IBOutlet var labelDistanceAway: UILabel!
    @IBOutlet var labelSavings: UILabel!
    @IBOutlet var labelPotentialSavings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewInternal.delegate = self
        tableViewInternal.dataSource = self
        tableViewInternal.rowHeight = UITableViewAutomaticDimension
        tableViewInternal.estimatedRowHeight = 100
        imageViewStoreImage.layer.cornerRadius = self.imageViewStoreImage.frame.size.width / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellContent(displayDetails: Bool) {
        tableViewInternal.hidden = !displayDetails
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if indexPath.row < 5 {
            if let storeCell  = tableView.dequeueReusableCellWithIdentifier("StoreItemCell", forIndexPath: indexPath) as? StoreItemTableViewCell {
                storeCell.setCellContentForItem(indexPath)
                cell = storeCell
            }
            
            
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("MoreCell", forIndexPath: indexPath)
        }
        
        return cell ?? UITableViewCell()
    }

}
