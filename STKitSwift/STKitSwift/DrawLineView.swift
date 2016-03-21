//
//  DrawLineView.swift
//  STKitSwift
//
//  Created by 沈兆良 on 16/3/21.
//  Copyright © 2016年 沈兆良. All rights reserved.
//

import UIKit

class DrawLineView: UIView {

    let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon1"))
        return imageView
    }()
    
    var path = UIBezierPath()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = (touches as NSSet).anyObject() as! UITouch
        path = UIBezierPath()
        path.moveToPoint(touch.locationInView(self))
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch = (touches as NSSet).anyObject() as! UITouch
        path.addLineToPoint(touch.locationInView(self))
        setNeedsDisplay()
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 给imageView添加核心动画
        // 添加核心动画
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = path.CGPath
        animation.duration = 3
        animation.repeatCount = MAXFLOAT
        subviews.first?.layer.addAnimation(animation, forKey: nil)
    }

    override func drawRect(rect: CGRect) {
        UIColor.colorRandom().setStroke()
        path.stroke()
    }

}
