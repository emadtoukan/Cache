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
                    cell = tempCell
                }
            case 1:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    cell = tempCell
                }
            case 2:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
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
                    cell = tempCell
                }
            case 1:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    cell = tempCell
                }
            case 2:
                if let tempCell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell {
                    cell = tempCell
                }
            default:
                break
            }
        }
    
        
        return cell
        
    }
    



}
