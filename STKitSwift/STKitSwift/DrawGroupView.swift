//
//  DrawGroupView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class DrawGroupView: UIView {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 同时缩放，平移，旋转
        let group = CAAnimationGroup()
        let scale = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = NSNumber(float: 0.5)

        let rotation = CABasicAnimation()
        rotation.keyPath = "transform.rotation"
        let number : Float = Float(numberRandom(M_PI))
        rotation.toValue = NSNumber(float:number)

        let position = CABasicAnimation()
        position.keyPath = "position"
        position.toValue = NSValue(CGPoint: CGPointMake(numberRandom(100), numberRandom(100)))

        group.animations = [scale, rotation, position]
        layer.addAnimation(group, forKey: nil)
    }

    override func drawRect(rect: CGRect) {
        UIColor.colorRandom().setFill()
        UIRectFill(rect)
    }

}
