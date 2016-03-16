
//
//  UIApplication+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

/** 1.打开自带mail */
public func openURLMail(mail:String){
    let url = NSURL(string:"mailto://"+mail)
    UIApplication.sharedApplication().openURL(url!)
}

/** 2.打开电话phone */
public func openURLTel(tel:String){
    let url = NSURL(string:"tel://"+tel)
    UIApplication.sharedApplication().openURL(url!)
}

/** 3.打开SMS */
public func openURLSMS(sms:String){
    let url = NSURL(string:"sms://"+sms)
    UIApplication.sharedApplication().openURL(url!)
}

/** 4.打开网站 */
public func openURLWeb(web:String){
    let url = NSURL(string:web)
    UIApplication.sharedApplication().openURL(url!)
}

public extension UIApplication {

}

