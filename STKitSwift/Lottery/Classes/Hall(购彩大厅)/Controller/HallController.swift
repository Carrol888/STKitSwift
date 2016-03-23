//
//  HallController.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/22.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class HallController: UIViewController {

    // MARK: - --- interface 接口
    private var isPopMenu : Bool = false
    private var items : [MenuItem] {
        get {
            let item0 = MenuItem.item("item0", image: UIImage(named: "Development")!)
            let item1 = MenuItem.item("item1", image: UIImage(named: "Development")!)
            let item2 = MenuItem.item("item2", image: UIImage(named: "Development")!)
            let item3 = MenuItem.item("item3", image: UIImage(named: "Development")!)
            let item4 = MenuItem.item("item4", image: UIImage(named: "Development")!)
            let item5 = MenuItem.item("item5", image: UIImage(named: "Development")!)
            return [item0, item1, item2, item3, item4, item5]
        }
    }

    private var downMenuView : DownMenuView?

    private var activeMenuView : ActiveMenuView?

    // MARK: - --- lift cycle 生命周期 ---
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Development"), target: self, action: "popMenu")
         self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "CS50_activity_image"), target: self, action: "active")

    }
    // MARK: - --- delegate 视图委托 ---

    // MARK: - --- event response 事件相应 ---
    func popMenu() {
        if isPopMenu == false {
            downMenuView = DownMenuView.show(view, items: items, originY: 44)
        }else {
            downMenuView!.hide()
        }

        isPopMenu = !isPopMenu
    }

    func active() {
        print("\(__FUNCTION__)")
        CoverView.show()
        activeMenuView = ActiveMenuView.showInPint(view.center)

    }
    // MARK: - --- private methods 私有方法 ---

    // MARK: - --- setters 属性 ---

    // MARK: - --- getters 属性 ---
}
