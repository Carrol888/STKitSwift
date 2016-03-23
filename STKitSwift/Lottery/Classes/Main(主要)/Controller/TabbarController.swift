//
//  TabbarController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/22.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController, TabBarDelegate{

    // MARK: - --- interface 接口

    var items:[UITabBarItem] = Array()
    // MARK: - --- lift cycle 生命周期 ---
    override func viewDidLoad() {
        super.viewDidLoad()

        // 购彩大厅
        addChildController(HallController(), title: "购彩大厅", imageName: "TabBar_LotteryHall_new", imageSelectedName: "TabBar_LotteryHall_selected_new")

        // 竞技场
        addChildController(ArenaController(), title: "购彩大厅", imageName: "TabBar_Arena_new", imageSelectedName: "TabBar_Arena_selected_new")

        // 发现
        addChildController(DiscoverController(), title: "发现", imageName: "TabBar_Discovery_new", imageSelectedName: "TabBar_Discovery_selected_new")

        // 开奖信息
        addChildController(HistoryController(), title: "开奖信息", imageName: "TabBar_History_new", imageSelectedName: "TabBar_History_selected_new")

        // 我的彩票
        addChildController(MyController(), title: "我的彩票", imageName: "TabBar_MyLottery_new", imageSelectedName: "TabBar_MyLottery_selected_new")

        let tabBar = TabBar()

        // 存储UITabBarItem
        tabBar.items = items
        tabBar.backgroundColor = UIColor.orangeColor()
        tabBar.frame = self.tabBar.bounds
        tabBar.delegate = self
        self.tabBar.addSubview(tabBar)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 把系统的tabBar上的按钮干掉

        for childView in self.tabBar.subviews {
            if !childView.isKindOfClass(TabBar) {
                childView.removeFromSuperview()
            }
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(childViewControllers)
    }
    // MARK: - --- delegate 视图委托 ---

    func tabBarClick(tabBar: TabBar, index: Int) {
        selectedIndex = index
        print(selectedIndex)
    }

    // MARK: - --- event response 事件相应 ---

    // MARK: - --- private methods 私有方法 ---
    func addChildController(controller: UIViewController, title:String, imageName:String, imageSelectedName:String) {
        // TODO 如何字符串转类型？
//        var controller : UIViewController = NSClassFromString(childControllerName) as! UIViewController
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: imageSelectedName)
        items.append(controller.tabBarItem)
        let childController = NavigationController(rootViewController:controller)
        addChildViewController(childController)
    }
    // MARK: - --- setters 属性 ---

    // MARK: - --- getters 属性 ---
}
