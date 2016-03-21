//
//  BaseView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/16.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        // 1.判断当前控件能否接收事件
        if userInteractionEnabled == false || hidden == true || alpha <= 0.01 {
            return nil
        }

        // 2. 判断点在不在当前控件
        if pointInside(point, withEvent: event) == false {
            return nil
        }

        // 3.从后往前遍历自己的子控件
        let count = subviews.count
        for i in 0 ..< count {
            let childView = subviews[i]
            // 把当前控件上的坐标系转换成子控件上的坐标系
            let childPoint = convertPoint(point, toView: childView)
            let fitView = childView.hitTest(childPoint, withEvent: event)
            if (fitView != nil) {
                return fitView
            }
        }
        return self
    }
}
