//
//  AppDelegate.swift
//  OhMyBox
//
//  Created by Thiago-Bernardes on 10/7/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import FBSDKCoreKit
import Parse
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
              Fabric.with([Crashlytics.self])
        
        setUpBarsAppearance()
        
        Parse.initialize(with: AppConfig.parse.baseClientConfig)
        
        PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)
        
        NotificationsManager.registerForNotifications()
        
        let initialViewController: UIViewController
        if (User.current != nil) {
            
            initialViewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Main", identifier: "")!
        } else {
            
            initialViewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Login", identifier: "")!
        }
        
        self.window!.rootViewController = initialViewController
        
        WishlistManager.shared.loadWishlist()
        FollowManager.shared.loadFollows()
        PurchaseRequestFeedbackManager.shared.loadFeedbackOptions()
        
        
//        let photoURL = URL(string: "https://storage.googleapis.com/ohmybox-dev/a84747cb38b2c3dd591de277416b3a1e_Kimono.png")!
//        
//        let photoData = UIImageJPEGRepresentation(UIImage(data: try! Data.init(contentsOf: photoURL))!, 1)
//        
//        let query = PFQuery(className: PhotoObject.parseClassName())
//        
//        query.findObjectsInBackground { (objects, error) in
//            
//            guard let brands = objects as? [PhotoObject] else { return }
//            
//            for brand in brands where brand.objectId == "MdgTvjlCqZ" {
//                
//                brand.photo = PFFile(data: photoData!, contentType: "image/jpeg")
//                
//                brand.saveInBackground(block: { (s, e) in
//                    print("saved", s)
//                })
//            }
//        }
////
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    
    func setUpBarsAppearance(){
    
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.isTranslucent = true
        navigationBarAppearance.tintColor = UIColor.black
        navigationBarAppearance.barTintColor =  UIColor.white
        navigationBarAppearance.backgroundColor =  UIColor.white
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
        
        let app = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        app.borderWidth = 1
        app.borderColor = UIColor.colorWithHexString("E0E0E0")
        app.cornerRadius = 5.0
    }
    
}
