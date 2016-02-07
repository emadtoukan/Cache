//
//  MainViewController.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-06.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit
import PNChart

enum Categories: String {
    case Grocery, Houseware, PersonalCare, Fuel, Bills, Utilities
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buttonGroceries: UIButton!
    @IBOutlet var buttonHouseWare: UIButton!
    @IBOutlet var buttonPharmaceutical: UIButton!
    @IBOutlet var buttonFuel: UIButton!
    @IBOutlet var buttonBills: UIButton!
    @IBOutlet var buttonUtilities: UIButton!
    @IBOutlet var imageViewBlurred: UIImageView!
    @IBOutlet var viewCircleContainerView: UIView!
    
    var selectedIndexPath: NSIndexPath?
    var storeSavings = StoreSavings(fileName: Categories.Grocery.rawValue) {
        didSet {
            self.selectedIndexPath = nil
            self.tableView.reloadData()
        }
    }
    
    var selectedCategory = Categories.Grocery {
        didSet {
            storeSavings = StoreSavings(fileName: selectedCategory.rawValue)
        }
    }
    
    // MARK: - View Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        buttonGroceries.alpha = 1
        buttonHouseWare.alpha = 0.3
        buttonPharmaceutical.alpha = 0.3
        buttonFuel.alpha = 0.3
        buttonBills.alpha = 0.3
        buttonUtilities.alpha = 0.3
        
        
        let familyImage = UIImage(named: "family7")
        self.imageViewBlurred.image = UIImageEffects.imageByApplyingBlurToImage(familyImage, withRadius: 20, tintColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), saturationDeltaFactor: 1, maskImage: nil)
        
        
        let cricleDiameter = CGFloat(80)
        let cricleFrame = CGRectMake(viewCircleContainerView.bounds.size.width/4, 70, cricleDiameter, cricleDiameter)
        let circleChart = PNCircleChart(frame: cricleFrame, total: 100, current: 65, clockwise: true, shadow: true, shadowColor: UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 0.8), displayCountingLabel: true, overrideLineWidth: 5)
        circleChart.strokeColor = UIColor(red: 225/255, green: 115/255, blue: 110/255, alpha: 1)
        circleChart.countingLabel.textColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 0.8)
        self.view.addSubview(circleChart)
        circleChart.strokeChart()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if self.navigationController?.viewControllers.count == 2 {
            self.navigationController?.viewControllers.removeAtIndex(1)
        }
    }
    
    // MARK: - Instance Methods
    
    @IBAction func categoryButtonPressed(sender: UIButton) {

        buttonGroceries.alpha = 0.3
        buttonHouseWare.alpha = 0.3
        buttonPharmaceutical.alpha = 0.3
        buttonFuel.alpha = 0.3
        buttonBills.alpha = 0.3
        buttonUtilities.alpha = 0.3
        
        switch sender {
        case buttonGroceries:
            selectedCategory = .Grocery
            buttonGroceries.alpha = 1
        case buttonHouseWare:
            selectedCategory = .Houseware
            buttonHouseWare.alpha = 1
        case buttonPharmaceutical:
            selectedCategory = .PersonalCare
            buttonPharmaceutical.alpha = 1
        case buttonFuel:
            selectedCategory = .Fuel
            buttonFuel.alpha = 1
        case buttonBills:
            selectedCategory = .Bills
            buttonBills.alpha = 1
        case buttonUtilities:
            selectedCategory = .Utilities
            buttonUtilities.alpha = 1
        default:
            break
        }
    }
    
    
    // MARK: - Table View Delegate Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeSavings.stores?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("StoreCell", forIndexPath: indexPath) as? StoreTableViewCell else {
            return UITableViewCell()
        }
        
        let store = storeSavings.stores?[indexPath.row]
        cell.setCellContent(indexPath == selectedIndexPath, store: store)
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
