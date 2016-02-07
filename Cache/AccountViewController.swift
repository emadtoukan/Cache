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
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as? AccountsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CellHeader") as? AccountHeaderTableViewCell else {
            return UIView()
        }
        
        cell.labelName.text = section == 0 ? "BANKING" : "BORROWING"
        return cell.contentView
        
    }


}
