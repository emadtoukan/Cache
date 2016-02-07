//
//  StoreItemTableViewCell.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class StoreItemTableViewCell: BaseTableViewCell {

    @IBOutlet var imageViewItemImage: UIImageView!
    @IBOutlet var labelItemName: UILabel!
    @IBOutlet var labelSavings: UILabel!
    @IBOutlet var viewBottomBorder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageViewItemImage.layer.cornerRadius = self.imageViewItemImage.frame.size.width / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellContentForItem(indexPath: NSIndexPath, storeItem: StoreItem?, hideFifthDivider: Bool) {
        if hideFifthDivider {
            viewBottomBorder.hidden = indexPath.row == 4 ? true : false
        }
        
        imageViewItemImage.image = UIImage(named: storeItem?.pictureName ?? "")
        labelItemName.text = storeItem?.title
        labelSavings.text = storeItem?.potentialSavings
        
    }

}
