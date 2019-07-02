//
//  STAlertController.swift
//  STKitSwiftDemo
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 沈兆良. All rights reserved.
//

import UIKit
import STKitSwift

class  STAlertController: UIViewController {
    
    // MARK: 1.lift cycle
    deinit {
        print("------------ STAlertController deinit ------------")
    }
    // MARK: 2.private methods
    
    // MARK: 3.event response
    
    @IBAction func actionButton(_ sender: UIButton) {
        let title = "Flutter 与 iOS 原生 WebView 对比"
        let message = "在iOS中使用的就是原生的WKWebView，所以总体和 native WKWebView 表现差不多。如果是混编项目中，因为它被包了一层，所以页面加载上存在一定的劣势，所以混编项目中仍然推荐使用 WKWebView。不过如果从多端考虑、以及项目可迁移等，那么使用也未尝不可，就是维护成本要增加一些，需要维护两套 webView。这个就需要根据自己的情况自己取舍了"
        STAlertView.show(title: title, message: message, cancelTitle: "取消", otherTitle: "确定") { (item) in
            print(item)
    
        }
    }
    
    @IBAction func actionNoTitle(_ sender: UIButton) {
        let message = "在iOS中使用的就是原生的WKWebView，所以总体和 native WKWebView 表现差不多。如果是混编项目中，因为它被包了一层，所以页面加载上存在一定的劣势，所以混编项目中仍然推荐使用 WKWebView。不过如果从多端考虑、以及项目可迁移等，那么使用也未尝不可，就是维护成本要增加一些，需要维护两套 webView。这个就需要根据自己的情况自己取舍了"
        STAlertView.show(title: nil, message: message, cancelTitle: "取消", otherTitle: "确定") { (item) in
            print(item)
            
        }
    }
    
    @IBAction func actionNoMessage(_ sender: UIButton) {
        let title = "Flutter 与 iOS 原生 WebView 对比"
        STAlertView.show(title: title, message: nil, cancelTitle: "取消", otherTitle: "确定") { (item) in
            print(item)
            
        }
    }
    
    @IBAction func actionNoCancel(_ sender: UIButton) {
        let title = "Flutter 与 iOS 原生 WebView 对比"
        let message = "在iOS中使用的就是原生的WKWebView，所以总体和 native WKWebView 表现差不多。如果是混编项目中，因为它被包了一层，所以页面加载上存在一定的劣势，所以混编项目中仍然推荐使用 WKWebView。不过如果从多端考虑、以及项目可迁移等，那么使用也未尝不可，就是维护成本要增加一些，需要维护两套 webView。这个就需要根据自己的情况自己取舍了"
        STAlertView.show(title: title, message: message, cancelTitle: nil, otherTitle: "确定") { (item) in
            print(item)
            
        }
    }
    
    @IBAction func actionNoButton(_ sender: UIButton) {
        let title = "Flutter 与 iOS 原生 WebView 对比"
        let message = "在iOS中使用的就是原生的WKWebView，所以总体和 native WKWebView 表现差不多。如果是混编项目中，因为它被包了一层，所以页面加载上存在一定的劣势，所以混编项目中仍然推荐使用 WKWebView。不过如果从多端考虑、以及项目可迁移等，那么使用也未尝不可，就是维护成本要增加一些，需要维护两套 webView。这个就需要根据自己的情况自己取舍了"
        STAlertView.show(title: title, message: message, cancelTitle: nil, otherTitle: nil) { (item) in
            print(item)
            
        }
    }
    // MARK: 4.interface
    
    // MARK: 5.getter
    
}
