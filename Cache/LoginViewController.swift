//
//  LoginViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    @IBOutlet var imageViewBackground: UIImageView!
    @IBOutlet var textfieldPIN: UITextField!
    @IBOutlet var textfieldScotiaCard: UITextField!

    // MARK: - View Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize View
        let familyImage = UIImage(named: "family1")
        self.imageViewBackground.image = UIImageEffects.imageByApplyingBlurToImage(familyImage, withRadius: 12, tintColor: nil, saturationDeltaFactor: 1, maskImage: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    // MARK: - Instance Methods
    @IBAction func backButtonPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func loginButtonPressed() {
        print("Login button pressed")
        self.view.endEditing(true)
        SVProgressHUD.showWithStatus("Loging In")
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            SVProgressHUD.dismiss()
            self.performSegueWithIdentifier("showMainView", sender: nil)
        }

    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    // MARK: - Textfield Delegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == textfieldScotiaCard {
            if range.location >= 16 {
                return false
            }
        }
        return true
    }
    
    @IBAction func textfieldEditingChanged(sender: UITextField) {
        
        var newString = Util.removeSpacesFromString(textfieldScotiaCard.text!)
        switch newString.characters.count {
        case 5,6,7:
            let startIndex = newString.startIndex
            newString.insert(" ", atIndex: startIndex.advancedBy(4))
        case 8,9,10:
            let startIndex = newString.startIndex
            newString.insert(" ", atIndex: startIndex.advancedBy(7))
            newString.insert(" ", atIndex: startIndex.advancedBy(4))
        case 11,12,13:
            let startIndex = newString.startIndex
            newString.insert(" ", atIndex: startIndex.advancedBy(10))
            newString.insert(" ", atIndex: startIndex.advancedBy(7))
            newString.insert(" ", atIndex: startIndex.advancedBy(4))
        default:
            break
        }
        textfieldScotiaCard.text = newString
    }
}
