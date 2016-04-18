//
//  AppDelegate.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /** 1.程序启动完成的时候调用 */
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        STApp.UUID()

    
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = UIViewController.controllerInitWithStoryBoardInitial("Main")
        window?.makeKeyAndVisible()


//        WelcomeView.welcomeView()
//        let welcomeView = WelcomeView()
//        welcomeView.frame = (window?.bounds)!
//        window?.addSubview(welcomeView)

        return true
    }

    /** 2.当app失去焦点的时候调用 */
    func applicationWillResignActive(application: UIApplication) {}

    /** 3.app进入后台的时候调用, app忽然打断的时候，在这里保存一些需要用到的数据 */
    func applicationDidEnterBackground(application: UIApplication) {}

    /** 4.app进入即将前台 */
    func applicationWillEnterForeground(application: UIApplication) {}

    /** 5.当app获取到焦点的时候调用，意味着app可以与用户交互 */
    func applicationDidBecomeActive(application: UIApplication) {}

    /** 6.app被关闭的时候调用 */
    func applicationWillTerminate(application: UIApplication) {}

    /** 7.app接收到内存警告的时候调用,清空图片的缓存 */
    func applicationDidReceiveMemoryWarning(application: UIApplication) {}
}

