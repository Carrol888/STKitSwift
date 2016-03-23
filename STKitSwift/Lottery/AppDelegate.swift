//
//  AppDelegate.swift
//  Lottery
//
//  Created by 沈兆良 on 16/3/22.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let tabbarVC = TabbarController()
        window?.rootViewController = tabbarVC
        window?.makeKeyAndVisible()
        return true
    }
}

