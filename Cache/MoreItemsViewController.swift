//
//  MoreItemsViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class MoreItemsViewController: UIViewController {

    @IBOutlet var labelStoreNAme: UILabel!
    var store: Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelStoreNAme.text = store?.name?.uppercaseString
    }

    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
