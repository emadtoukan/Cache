//
//  CacheItActionsViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-07.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class CacheItActionsViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    weak var delegate: MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in buttons {
            button.layer.borderColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1).CGColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        delegate?.hideCacheItActions()
    }

}
