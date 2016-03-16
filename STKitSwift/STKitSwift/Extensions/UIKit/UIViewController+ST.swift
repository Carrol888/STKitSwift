
//
//  UIViewController+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/15.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    // TODO 这个方法与默认初始化在iOS9上没分别
    // 1.从NIB中初始化
    public class func controllerInitWithNib() -> UIViewController{
        let controllerName = stringFromClass(self)
        let controller = self.init(nibName: controllerName, bundle: nil)
        return controller
    }

    // 2.获取故事板的最初的控制器
    public class func controllerInitWithStoryBoardInitial(storyBoardName:String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyBoard.instantiateInitialViewController()!
    }

    // 3.获取故事版的控制器，控制器的故事版ID和自身的类名相同
    public class func controllerInitWithStoryBoard(storyBoardName:String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyBoardName, bundle: nil)
        let controllerName = stringFromClass(self)
        let controller = storyBoard.instantiateViewControllerWithIdentifier(controllerName!)
        return controller
    }
}
