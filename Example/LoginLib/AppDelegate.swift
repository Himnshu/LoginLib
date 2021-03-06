//
//  AppDelegate.swift
//  LoginLib
//
//  Created by himanshumahajan68@gmail.com on 07/29/2017.
//  Copyright (c) 2017 himanshumahajan68@gmail.com. All rights reserved.
//

import UIKit

import ParseFacebookUtilsV4

import ParseTwitterUtils

import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("124fgoewtijoewiotrewjio3432kdsfgkd", clientKey: "442jkfkldskldgkldskgldshklgkdsggsd")
        
        PFFacebookUtils.initializeFacebook(applicationLaunchOptions: launchOptions)
        
        PFTwitterUtils.initialize(withConsumerKey: "djgfdlskgbdjsklgbjdsgbjds", consumerSecret:"djksgjdksgjkdsgjkdsjkgdsjkgsdjkgdjksgjkdsgjkdsgkj")
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        // Add any custom logic here.
        return handled
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

