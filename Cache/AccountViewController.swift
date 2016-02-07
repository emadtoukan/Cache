//
//  AccountViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var imageViewBlurredBackground: UIImageView!
    @IBOutlet var imageViewUserImage: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let familyImage = UIImage(named: "Pasted image at 2016_02_07 10_33 AM")
        self.imageViewBlurredBackground.image = UIImageEffects.imageByApplyingBlurToImage(familyImage, withRadius: 50, tintColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), saturationDeltaFactor: 1, maskImage: nil)
        
        imageViewUserImage.layer.cornerRadius = self.imageViewUserImage.frame.size.width / 2
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - Table View Delegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("CellHeader", forIndexPath: indexPath) as? AccountHeaderTableViewCell {
                    tempCell.labelName.text = "BANKING"
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 104/255, green: 169/255, blue: 159/255, alpha: 1)
                    tempCell.labelName.textColor = UIColor(red: 104/255, green: 169/255, blue: 159/255, alpha: 1)
                    cell = tempCell
                }
            case 1:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 104/255, green: 169/255, blue: 159/255, alpha: 1)
                    tempCell.labelAccountName.text = "Momentum Chequing Account"
                    tempCell.labelAccountNumber.text = "40592 01686 65"
                    tempCell.labelAmount.text = "$2,304.65"
                    tempCell.labelDate.text = "Jun 7, 2015"
                    cell = tempCell
                    
                }
            case 2:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 104/255, green: 169/255, blue: 159/255, alpha: 1)
                    tempCell.labelAccountName.text = "Momentum Chequing Account"
                    tempCell.labelAccountNumber.text = "40592 21346 51"
                    tempCell.labelAmount.text = "$5,150.43"
                    tempCell.labelDate.text = "Jan 19, 2014"
                    tempCell.imageView2.hidden = true
                    cell = tempCell
                }
            default:
                break
            }
        } else {
            switch indexPath.row {
            case 0:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("CellHeader", forIndexPath: indexPath) as? AccountHeaderTableViewCell {
                    tempCell.labelName.text = "BORROWING"
                    tempCell.labelName.textColor = UIColor(red: 204/255, green: 109/255, blue: 107/255, alpha: 1)
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 204/255, green: 109/255, blue: 107/255, alpha: 1)
                    cell = tempCell
                }
            case 1:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 204/255, green: 109/255, blue: 107/255, alpha: 1)
                    tempCell.labelAccountName.text = "GM VISA Card"
                    tempCell.labelAccountNumber.text = "40593 21534 37"
                    tempCell.labelAmount.text = "$3,531.91"
                    tempCell.labelDate.text = "Dec 19, 2015"
                    tempCell.imageView2.hidden = true
                    cell = tempCell
                }
            case 2:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    tempCell.viewSideBar.backgroundColor = UIColor(red: 204/255, green: 109/255, blue: 107/255, alpha: 1)
                    tempCell.labelAccountName.text = "ScotiaLine Personal"
                    tempCell.labelAccountNumber.text = "40592 85937 36"
                    tempCell.labelAmount.text = "$3,356.83"
                    tempCell.labelDate.text = "Nov 16, 2011"
                    tempCell.imageView2.hidden = true
                    cell = tempCell
                }
            default:
                break
            }
        }
    
        
        return cell
        
    }
    



}
