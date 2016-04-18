//
//  STApp.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

/** 1.获取 AppDelegate */
let APPDelegate:UIApplicationDelegate = UIApplication.sharedApplication().delegate!
/** 2.APP的命名空间名称 */
let APPExecutable:String = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
/** 3.APP的版本号 */
let APPVersion:String = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
/** 4.APP的名称 */
let APPName:String = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
/** 5.APP的ID */
let APPIdentifier:String = NSBundle.mainBundle().infoDictionary!["CFBundleIdentifier"] as! String

public class STApp {
    /** 
     1.唯一的标识符
     */
    static func UUID() -> NSString {
        let theUUID: CFUUIDRef? = CFUUIDCreate(kCFAllocatorDefault)
        let string: CFStringRef? = CFUUIDCreateString(kCFAllocatorDefault, theUUID)
        return string!
    }
}
