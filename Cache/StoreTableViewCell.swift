//
//  StoreTableViewCell.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class StoreTableViewCell: BaseTableViewCell, UITableViewDataSource, UITableViewDelegate {

    
    var store: Store?
    @IBOutlet var tableViewInternal: UITableView!
    @IBOutlet var imageViewStoreImage: UIImageView!
    @IBOutlet var labelStoreName: UILabel!
    @IBOutlet var imageViewLocationIcon: UIImageView!
    @IBOutlet var labelDistanceAway: UILabel!
    @IBOutlet var labelSavings: UILabel!
    @IBOutlet var labelPotentialSavings: UILabel!
    weak var mainViewcontroller: MainViewController?
    
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
    
    func setCellContent(displayDetails: Bool, store: Store?, mainViewcontroller: MainViewController) {
        self.store = store
        self.mainViewcontroller = mainViewcontroller
        tableViewInternal.hidden = !displayDetails
        imageViewStoreImage.image = UIImage(named: store?.pictureName ?? "")
        labelStoreName.text = store?.name
        labelDistanceAway.text = store?.distanceAway
        labelSavings.text = store?.potentialSavings
        tableViewInternal.reloadData()
        
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if indexPath.row < 5 {
            if let storeCell  = tableView.dequeueReusableCellWithIdentifier("StoreItemCell", forIndexPath: indexPath) as? StoreItemTableViewCell {
                let storeItem = store?.items?[indexPath.row]
                storeCell.setCellContentForItem(indexPath, storeItem: storeItem)
                cell = storeCell
            }
        } else {
            if let moreCell = tableView.dequeueReusableCellWithIdentifier("MoreCell", forIndexPath: indexPath) as? StoreMoreTableViewCell {
                moreCell.delegate = mainViewcontroller
                moreCell.store = store
                cell = moreCell
            }
        }
        
        return cell ?? UITableViewCell()
    }

}
