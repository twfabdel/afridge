//
//  AppDelegate.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.setBackgroundImage(#imageLiteral(resourceName: "title-nav-background"), for: .top, barMetrics: .default)
        
        navigationBarAppearance.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBarAppearance.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBarAppearance.titleTextAttributes = [NSFontAttributeName: UIFont(name: "American Typewriter", size: 22)!, NSForegroundColorAttributeName: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSBaselineOffsetAttributeName: NSNumber(value: 7)]
        
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.09019607843, green: 0.431372549, blue: 0.7019607843, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.8144705816, blue: 0.1871252418, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: #colorLiteral(red: 1, green: 0.8144705816, blue: 0.1871252418, alpha: 1)], for: .selected)
//        UITabBar.appearance().layer.backgroundColor = UIColor(colorLiteralRed: 69.0/255.0, green: 133.0/255.0, blue: 189.0/255.0, alpha: 1.0).cgColor

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


}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.closeKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
    }
    
    func closeKeyboard() {
        view.endEditing(true)
    }
}

extension UITabBarController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.items?.forEach({ (item) -> () in
            item.image = item.selectedImage?.withRenderingMode(.alwaysOriginal)
        })
    }
}

