//
//  TransactionsTableViewCell.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: BaseTableViewCell {

    @IBOutlet var imageViewReceipt: UIImageView!
    @IBOutlet var labelStoreName: UILabel!
    @IBOutlet var labelReceiptDate: UILabel!
    @IBOutlet var labelLocation: UILabel!
    @IBOutlet var labelAmount: UILabel!
    @IBOutlet var labelTotalSaved: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellContent(transaction: Transaction?) {
        imageViewReceipt.image = UIImage(named: transaction?.receiptPictureName ?? "")
        labelStoreName.text = transaction?.storeName
        labelReceiptDate.text = transaction?.receiptDate
        labelLocation.text = transaction?.address
        labelAmount.text = transaction?.amountSpent
        labelTotalSaved.text = transaction?.totalSave
    }
}
