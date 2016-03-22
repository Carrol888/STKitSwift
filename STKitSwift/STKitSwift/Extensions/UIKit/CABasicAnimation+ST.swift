//
//  CABasicAnimation+ST.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import Foundation
import UIKit

public extension CABasicAnimation {
    
    public convenience init(keyPath:String, repeatCount:Float, duration:CFTimeInterval, removedOnCompletion: Bool, timingFunction:CAMediaTimingFunction,fromValue:AnyObject,byValue:AnyObject) {
        self.init()

        // 指定CALayer的属性
        self.keyPath = keyPath
        // 设置循环次数
        self.repeatCount = repeatCount
        // 动画持续时间
        self.duration = duration
        // 保持动画执行后的状态
        self.removedOnCompletion = removedOnCompletion
        // 设置移动的效果
        self.timingFunction = timingFunction

        self.fromValue = fromValue
        self.byValue = byValue
    }

    public convenience init(keyPath:String, repeatCount:Float, duration:CFTimeInterval, removedOnCompletion: Bool, timingFunction:CAMediaTimingFunction,fromValue:AnyObject,toValue:AnyObject) {
        self.init()

        // 指定CALayer的属性
        self.keyPath = keyPath
        // 设置循环次数
        self.repeatCount = repeatCount
        // 动画持续时间
        self.duration = duration
        // 保持动画执行后的状态
        self.removedOnCompletion = removedOnCompletion
        // 设置移动的效果
        self.timingFunction = timingFunction

        self.fromValue = fromValue
        self.toValue = toValue
    }

}

