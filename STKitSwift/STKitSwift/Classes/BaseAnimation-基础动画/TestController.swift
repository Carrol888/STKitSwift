//
//  TestController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class TestController: UIViewController {

    // MARK: - --- interface 接口

    // MARK: - --- lift cycle 生命周期 ---
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.backgroundColor = UIColor.colorRandom()
        button.frame = CGRectMake(100, 100, 100, 44)
        button.setTitle("backVC", forState:UIControlState.Normal)
        button.setTitleColor(UIColor.colorRandom(), forState: .Normal)
        button.addTarget(self, action: #selector(TestController.backVC), forControlEvents:UIControlEvents.TouchUpInside)
        view.addSubview(button)
    }
    // MARK: - --- delegate 视图委托 ---

    // MARK: - --- event response 事件相应 ---
    func backVC(){
        self.view.removeFromSuperview()
//        self.dismissViewControllerAnimated(true) { () -> Void in
//
//        }
    }
    // MARK: - --- private methods 私有方法 ---

    // MARK: - --- setters 属性 ---

    // MARK: - --- getters 属性 ---
}
