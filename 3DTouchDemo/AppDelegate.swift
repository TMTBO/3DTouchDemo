//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by TenmaTobyo on 9/5/16.
//  Copyright © 2016 TenmaTobyo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let Vc = ViewController()
        Vc.view.backgroundColor = UIColor.white
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: Vc)
        window?.makeKeyAndVisible()
        
        // current is support 3Dtouch or  not
        if Vc.traitCollection.forceTouchCapability == UIForceTouchCapability.unavailable {
            print("----------not support")
            return true
        }
        
        // item1
        let icon1 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.add)
        let item1 = UIApplicationShortcutItem(type: "item1", localizedTitle: "enterPoint1", localizedSubtitle: "enterPoint1-1", icon: icon1, userInfo: nil)
        
        // item2
        let icon2 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.audio)
        let item2 = UIApplicationShortcutItem(type: "item2", localizedTitle: "enterPoint2", localizedSubtitle: "enterPoint2-2", icon: icon2, userInfo: nil)
        
        // item3
        let icon3 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.capturePhoto)
        let item3 = UIApplicationShortcutItem(type: "item3", localizedTitle: "enterPoint3", localizedSubtitle: "enterPoint3-3", icon: icon3, userInfo: nil)
        
        // item4
        let icon4 = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.compose)
        let item4 = UIApplicationShortcutItem(type: "item4", localizedTitle: "enterPoint4", localizedSubtitle: nil, icon: icon4, userInfo: nil)
        
        application.shortcutItems = [item1, item2, item3, item4]
        
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
    /// MARK: - 3DTouch Home actions
    private func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        print("----------\(shortcutItem.type)")
        
        // handle defferent items according to item's type you have set above 
        switch shortcutItem.type {
        case "item1":
            print("----------This is item1")
            application.keyWindow?.rootViewController?.view.backgroundColor = UIColor.red
        case "item2":
            print("----------This is item2")
            application.keyWindow?.rootViewController?.view.backgroundColor = UIColor.blue
        case "item3":
            print("----------This is item3")
            application.keyWindow?.rootViewController?.view.backgroundColor = UIColor.green
        case "item4":
            print("----------This is item4")
            application.keyWindow?.rootViewController?.view.backgroundColor = UIColor.gray
        default:
            break
        }
    }
    
}

