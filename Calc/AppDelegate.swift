//
//  AppDelegate.swift
//  Calc
//
//  Created by Oliver Paray on 9/23/19.
//  Copyright © 2019 Oliver Paray. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func balanced(_ str: String) -> Bool {
        var result: Bool = false
        var charDict = Dictionary<String,Int>()
        for char in str {
            if let num = charDict["\(char)"] {
                charDict["\(char)"] = num + 1
            } else {
                charDict["\(char)"] = 1
            }
        }
        let keyChars = charDict.map({$0.key})
        let keyVals = charDict.map({$0.value})
        let allX = charDict.keys["x"]
        let allY = charDict.keys["y"]
        result = (allX == allY)
        return result
    }
    
    func balancedBonus(_ str: String) -> Bool {
        var result = false
        var charDict = Dictionary<String,Int>()
        for char in str {
            if let num = charDict["\(char)"] {
                charDict["\(char)"] = num + 1
            } else {
                charDict["\(char)"] = 1
            }
        }
        var lastCount: Int? = nil
        for (_, keyCount) in charDict.keys {
            if let val = lastCount {
                result = (lastCount == keyCount)
            } else {
                lastCount = keyCount
            }
        }
        return result
    }
    
}

