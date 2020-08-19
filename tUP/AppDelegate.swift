//
//  AppDelegate.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import Firebase
import SwiftMessages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        SwiftMessages.defaultConfig.presentationStyle = .top
        SwiftMessages.defaultConfig.prefersStatusBarHidden = true
        SwiftMessages.defaultConfig.presentationContext = .window(windowLevel: .statusBar)
        //SwiftMessages.defaultConfig.
        
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

