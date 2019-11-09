//
//  AppDelegate.swift
//  Starter
//
//  Created by Premkumar  on 06/11/19.
//  Copyright © 2019 ktrkathir. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /// Show starter
    fileprivate func showStarter() {
        let startVC = StarterViewController.loadFromNib()
        startVC.loadView()
        startVC.themeColor = UIColor.blue.withAlphaComponent(0.7)
        startVC.welcomeLabel.text = "Welcome to"
        startVC.appNameLabel.text = "Starter"
        startVC.featureDescriptionLabel.text = "You can use starter show release notes better and clearly like Apple native apps."
        startVC.dismiss.setTitle("Continue", for: .normal)
        
        let details = [FeatureDetail(icon: #imageLiteral(resourceName: "photos"),
                                     title: "Clear details",
                                     subTitle: "Present a major features to yours like this."),
                       FeatureDetail(icon: #imageLiteral(resourceName: "photos"),
                                     title: "Fully Customized",
                                     subTitle: "Full permission to customise what you need."),
                       FeatureDetail(icon: #imageLiteral(resourceName: "photos"),
                                     title: "Press continue",
                                     subTitle: "Press continue button below of this to start using your application.")]
        startVC.features = details
        startVC.delegate = self
        window?.rootViewController = startVC
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        showStarter()
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

/// MARK: Starter View Delegate
extension AppDelegate: StarterViewDelegate {
    
    func continueButtonWasTapped(startViewController: StarterViewController) {
        // StarterViewController continue button was tapped.
        
        let initialVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
        window?.rootViewController = initialVC
    }
    
}
