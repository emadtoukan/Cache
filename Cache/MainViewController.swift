//
//  MainViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    var selectedIndexPath: NSIndexPath?
    
    // MARK: - View Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(self.navigationController?.viewControllers.removeAtIndex(1))
        
    }
    
    
    
    // MARK: - Table View Delegate Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("StoreCell", forIndexPath: indexPath) as? StoreTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCellContent(indexPath == selectedIndexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Did select indexPath: \(indexPath.row)")
        
        var indexPathsToReload = [NSIndexPath]()
        indexPathsToReload.append(indexPath)
        
        if let uSelectedIndexPath = selectedIndexPath {
            indexPathsToReload.append(uSelectedIndexPath)
        }
        
        selectedIndexPath = selectedIndexPath == indexPath ? nil : indexPath
        tableView.reloadRowsAtIndexPaths(indexPathsToReload, withRowAnimation: UITableViewRowAnimation.Fade)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.None, animated: false)
    }

}
