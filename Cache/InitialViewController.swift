//
//  InitialViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    
    // MARK: - Properties
    @IBOutlet var buttonLogin: UIButton!
    
    // MARK: - View Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize UI
        buttonLogin.alpha = 0
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.7) { () -> Void in
            self.buttonLogin.alpha = 1
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - Instance Methods

    @IBAction func loginButtonPressed() {
        self.performSegueWithIdentifier("showLoginViewController", sender: nil)
    }
    
}
