//
//  TouchView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/16.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class TouchView: UIView {
    // 当手指开始触摸view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("\(#function)")
    }

    // 当手指在view上移动的时候
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        print("\(__FUNCTION__)")
        // 获取UITouch对象
        let touch : UITouch! = (touches as NSSet).anyObject()! as! UITouch
        // 获取当前点
        let currentPoint = touch.locationInView(self)
        // 获取上一个点
        let prePoint = touch.previousLocationInView(self)
        // 获取x轴偏移量
        let offsetX = currentPoint.x - prePoint.x;
         // 获取y轴偏移量
        let offsetY = currentPoint.y - prePoint.y;

        transform = CGAffineTransformTranslate(transform, offsetX, offsetY)

    }
    // 当手指离开这个view的时候
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("\(#function)")
    }

    // 当触摸事件被打断的时候调用(电话打入)
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("\(#function)")
    }

    override func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
        print("\(#function)")
    }

}
