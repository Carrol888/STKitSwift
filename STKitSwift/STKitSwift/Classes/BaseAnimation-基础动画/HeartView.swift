//
//  HeartView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class HeartView: UIView {
    let animation : CABasicAnimation = {
        let animation = CABasicAnimation()
        // 描述下修改哪个属性产生动画
        //        animation.keyPath = "position"
        // 只能是layer属性
        animation.keyPath = "transform.scale"
        // 设置值
        //        animation.toValue = NSValue(CGPoint: CGPointMake(100, 100))
        //        animation.toValue = NSValue(nonretainedObject: NSNumber(double: 0.5))
        animation.toValue = NSNumber(float: 0.5)

        // 设置动画执行次数
        animation.repeatCount = MAXFLOAT
        // 取消动画反弹
        // 设置动画完成的时候不要移除动画
        animation.removedOnCompletion = false
        // 设置动画执行完成要保持最新的效果
        animation.fillMode = kCAFillModeForwards
        return animation
    }()

    func start() {
        layer.addAnimation(animation, forKey: nil)
    }

    override func drawRect(rect: CGRect) {
        UIColor.colorRandom().setFill()
        UIRectFill(rect)

        let image = UIImage(named: "heart")
        image?.drawInRect(rect)
    }

}
