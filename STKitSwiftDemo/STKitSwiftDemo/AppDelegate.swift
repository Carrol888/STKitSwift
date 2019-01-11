//
//  AppDelegate.swift
//  STKitSwiftDemo
//
//  Created by 沈兆良 on 2018/12/5.
//  Copyright © 2018 沈兆良. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection10.bundle")?.load()
        #endif

        // Override point for customization after application launch.
        return true
    }
}
