//
//  AccountsTableViewCell.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    @IBOutlet var labelAccountName: UILabel!
    @IBOutlet var labelAccountNumber: UILabel!
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var labelAmount: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet weak var viewSideBar: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView1.layer.cornerRadius = self.imageView1.frame.size.width / 2
        imageView2.layer.cornerRadius = self.imageView2.frame.size.width / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
