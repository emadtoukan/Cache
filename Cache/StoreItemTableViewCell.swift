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
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellContentForItem(indexPath: NSIndexPath) {
        viewBottomBorder.hidden = indexPath.row == 4 ? true : false
    }

}
