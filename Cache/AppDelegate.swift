//
//  AppDelegate.swift
//  Cache
//
//  Created by Emad Toukan on 2016-02-05.
//  Copyright © 2016 Cache.io. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().tintColor = UIColor(red: 225/255, green: 115/255, blue: 110/255, alpha: 1)
        self.setupParse(launchOptions)
        self.setupNotifications(application, launchOptions: launchOptions)
        self.setupSVProgress()
                
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Setup Methods
    func setupParse(launchOptions: [NSObject: AnyObject]?) {
        // Parse
        Parse.setApplicationId("9vV0SYRCEkFFBieeX9rFKVo6wHBUd6wkQatkZ6Fp",
            clientKey: "3uLGDZnrzDxIm8VkF72MMYB8euol0FMwWjUgvyoU")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
    }
    
    
    // MARK: - Registering for notifications
    func setupNotifications(application: UIApplication, launchOptions: [NSObject: AnyObject]?) {
        // Camera Action
        let cameraAction = UIMutableUserNotificationAction()
        cameraAction.identifier = "CAMERA_ACTION_IDENTIFIER"
        cameraAction.title = "📷"
        cameraAction.activationMode = UIUserNotificationActivationMode.Background
        cameraAction.destructive = false
        cameraAction.authenticationRequired = false
        
        let cameraCategory = UIMutableUserNotificationCategory()
        cameraCategory.identifier = "CAMERA_NOTIFICATION_IDENTIFIER"
        cameraCategory.setActions([cameraAction], forContext: UIUserNotificationActionContext.Default)
        
        // This will register the app for receiving notifications and will prompt the user to accept the notifications
        // We pass the list of categories to the settings
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: [cameraCategory])
        application.registerUserNotificationSettings(notificationSettings)
        
        // Register the app for remote notifications
        application.registerForRemoteNotifications()
        
        // NOTE: If the user swipes or taps on the notification, and the application was in the background, we can get the local or remote notification in here
        if let notification = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] {
            // TODO: Notification can be handled here, when the user launched the app with the notification
        }

        func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
            
            // We get back the types of notifications that have been approved
            print(notificationSettings.types)
            
            // We can also get access to the notification types that are approved by
            let currentSettings = UIApplication.sharedApplication().currentUserNotificationSettings()?.types
            print(currentSettings)
            // TODO: What should we do if the user disabled the notifications?
        }
    }
    
    // REMOTE
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("didRegisterForRemoteNotificationsWithDeviceToken: \(deviceToken)")
        
        // Changing the device token to string
        let tokenString = deviceToken.description.stringByReplacingOccurrencesOfString("[ <>]", withString: "", options: .RegularExpressionSearch, range: nil)
        print("Token string format: \(tokenString)")
        
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        // Error happened while registering the the device for remove notification
        // TODO: Need to handle this case if the user is unable to receive notifications
        // We can check if the device had a token previously, if it didn't have, then we can display an error somewhere that the device current cannot receive notifications.
        print("didFailToRegisterForRemoteNotificationsWithError: \(error)")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        // NOTE: We will receive the notification here if the application was in the background or the foreground
        // TODO: Check if the notification is received while the user has the application open, would the app display the notification or this has to be displayed manually
        print("didReceiveRemoteNotification: \(userInfo)")
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        // NOTE: We can get the action from the notification in here
        // If we implement this delegate method, the other delegate method without the responseInfo will not be called
        
        if let uIdentifier = identifier {
            switch uIdentifier{
            case "CAMERA_ACTION_IDENTIFIER":
//                let something
                break
            default:
                print("Some action was pressed")
            }
        }
        completionHandler()
    }
    
    // MARK: - Setup Progress
    func setupSVProgress() {
        SVProgressHUD.setForegroundColor(UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1))
        SVProgressHUD.setRingThickness(2.5)
        SVProgressHUD.setFont(UIFont(name: "ClanOT-Medium", size: 16))
//        SVProgressHUD.setSuccessImage(UIImage(named: "CheckmarkGrey"))
//        SVProgressHUD.setErrorImage(UIImage(named: "CrossGrey"))
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
    }
}

