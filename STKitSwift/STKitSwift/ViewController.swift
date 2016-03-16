//
//  ViewController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - --- interface 接口

    // MARK: - --- lift cycle 生命周期 ---

    // loadView作用：自定义控制器的view
    // loadView什么时候调用：第一次使用控制器的view的时候调用
    // 注意：在这个方法中如果没有自定义view,就不能获取控制器的view
    // 一旦重写了这个方法，就不要调用[super loadView]
    // 如果重写了这个方法，就不会去加载storyboard描述的控制器的View
    override func loadView() {
        let viewSelf = UIView(frame: CGRectZero)
        viewSelf.backgroundColor = UIColor.colorRandom()

        let button = UIButton(frame: CGRectMake(0, 0, 100, 100))
        button.backgroundColor = UIColor.colorRandom()
        viewSelf.addSubview(button)

        view = viewSelf
    }

    override func loadViewIfNeeded() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第一个控制器"

        let item0 = UIBarButtonItem(title: "ST", style: UIBarButtonItemStyle.Done, target: self, action: nil)
        let item1 = UIBarButtonItem(title: "ST", style: .Plain, target: self, action: nil)
        let item2 = UIBarButtonItem(title: "ST", target: self, action: nil)

        navigationItem.rightBarButtonItems = [item0, item1, item2]
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for viewSub in (self.navigationController?.navigationBar.subviews)! {
//            print(viewSub)

            if viewSub.isKindOfClass(NSClassFromString("_UINavigationBarBackground")!) {
                for viewSubSub in viewSub.subviews {
                    print(viewSubSub)

                    if viewSubSub.isKindOfClass(NSClassFromString("UIImageView")!) {
                        viewSubSub.backgroundColor = UIColor.orangeColor()
                    }
                }
            }

            }
        }
    }

    // MARK: - --- delegate 视图委托 ---

    // MARK: - --- event response 事件相应 ---

    // MARK: - --- private methods 私有方法 ---

    // MARK: - --- setters 属性 ---
    
    
    // MARK: - --- getters 属性 ---


